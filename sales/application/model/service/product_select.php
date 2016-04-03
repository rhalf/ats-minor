<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Product;
use Core\Result;

$array['product'] = array();
$array['result'] = array();

$connection = null;
try {
	if ($server->Type == Server::MSSQL) {
		$connection = new PDO("mssql:host=$server->Ip;dbname=", $user, $pass);
		$connection = new PDO("sybase:host=$server->Ip;dbname=", $user, $pass);
	} else if ($server->Type == Server::MYSQL) {
		$connection = new PDO("mysql:host=$server->Ip;dbname=", $database->Username, $database->Password);
	}else{
		$connection = new PDO("sqlite:my/database/path/database.db");
	}
	$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$connection->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);

	//-----------------------------------------------------------------------
	$query = $connection->prepare('
		CALL ats.product_select();');

	$query->execute();

	while ($row = $query->fetch(PDO::FETCH_BOTH)) {
		$product = new Product();
		$product->Id = $row["id"];
		$product->Name = $row["product_name"];
		$product->Description = $row["product_description"];
		$product->Company = $row["product_company"];

		array_push($array['product'], $product);
	}

	//-------------------------------------------------------------------
	$result = new Result(Result::SUCCESS,"Success!");
	array_push($array['result'],$result);
} catch(PDOException $pdoException) {
	$result = new Result(Result::FAILED, $pdoException->getMessage());
	array_push($array['result'], $result);
} catch(Exception $exception) {
	$result = new Result(Result::FAILED, $exception->getMessage());
	array_push($array['result'], $result);
}
$connection = null;
echo json_encode($array);
?>
