<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\ProductOffered;
use Core\ClientResponse;
use Core\Result;
use Core\User;


$array['result'] = array();
$array['productoffered'] = array();

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

	//-------------------------------------------------------------------

	$sql = "
			CALL ats.product_offered();
		";

	$query = $connection->prepare($sql);

	$query->execute();

	while ($row = $query->fetch(PDO::FETCH_BOTH)) {
		$productOffered = new ProductOffered();
		$productOffered->Id = $row["id"];
		$productOffered->DateTime = $row["product_offered_datetime"];
		$productOffered->Company = $row["company_name"];
		$productOffered->Product = $row["product_name"];
		$productOffered->Contact = $row["contact_data"];
		$productOffered->ContactType = $row["contact_type_name"];
		$productOffered->ClientResponse = $row["client_response_name"];
		$productOffered->User = $row["user_name"];
		array_push($array['productoffered'], $productOffered);
	}


	//-------------------------------------------------------------------

$result = new Result(Result::SUCCESS,"Success!");
array_push($array['result'], $result);
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
