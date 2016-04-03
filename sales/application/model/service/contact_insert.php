<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Result;
use Core\User;
use Core\Contact;


$array['result'] = array();

$connection = null;

try {
	$contact = new Contact();
	

	$contact->Company = $_POST['Company'];
	$contact->Person = $_POST['Person'];
	$contact->Position = $_POST['Position'];
	$contact->Email = $_POST['Email'];
	$contact->Mobile = $_POST['Mobile'];
	$contact->Telephone = $_POST['Telephone'];
	$contact->Fax = $_POST['Fax'];
	$contact->Country = $_POST['Country'];



	$userId = $_SESSION['user']->Id;


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
	CALL ats.contact_insert(" .
		$contact->Company . ",'" .
		$contact->Person . "','" . 
		$contact->Position  . "','" . 
		$contact->Email . "','" . 
		$contact->Mobile  . "','" . 
		$contact->Telephone  . "','" . 
		$contact->Fax  . "'," . 
		$contact->Country . "," . 
		$userId . ");";

$query = $connection->prepare($sql);

if (!$query->execute()) {
	throw new Exception($contact->Data . " not added!", 1);
}
	//-------------------------------------------------------------------

$result = new Result(Result::SUCCESS,"Added new contact!");
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
