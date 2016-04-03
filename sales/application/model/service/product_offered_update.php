<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\ProductOffered;
use Core\ClientResponse;
use Core\Product;
use Core\Result;
use Core\User;


$array['result'] = array();
$array['product'] = array();

$connection = null;

try {
	$product = new Product();
	
	if (!isset($_POST['Id']))
		throw new Exception("Id is not set.", 1);
	if (!isset($_POST['DateTime']))
		throw new Exception("DateTime is not set.", 1);
	if (!isset($_POST['Product']))
		throw new Exception("Product is not set.", 1);
	if (!isset($_POST['Company']))
		throw new Exception("Company offered  is not set.", 1);
	if (!isset($_POST['Contact']))
		throw new Exception("Contact is not set.", 1);
	if (!isset($_POST['ClientResponse']))
		throw new Exception("Client response is not set.", 1);
	

	$product->Id = $_POST['Id'];
	$product->DateTime = $_POST['DateTime'];
	$product->Product = $_POST['Product'];
	$product->Company = $_POST['Company'];
	$product->Contact = $_POST['Contact'];
	$product->ClientResponse = $_POST['ClientResponse'];
	$product->User = $_SESSION['user']->Id;


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
	CALL ats.product_offered_update(".
		$product->Id. ",'" .
		$product->DateTime. "'," .
		$product->Product. "," .
		$product->Company. "," .
		$product->Contact. "," .
		$product->ClientResponse. "," .
		$product->User . "," .
		$product->User . ");";

//throw new Exception($sql, 1);

$query = $connection->prepare($sql);

if (!$query->execute()) {
	throw new Exception($product->Product . " not updated!", 1);
}
	//-------------------------------------------------------------------

$result = new Result(Result::SUCCESS, "ProductOffered has been updated!");
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
