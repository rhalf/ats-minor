<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Contact;
use Core\ContactType;
use Core\Company;
use Core\Result;

$array['result'] = array();
$array['contact'] = array();
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
	CALL ats.contact_select();
	');

	$query->execute();

	

	while ($row = $query->fetch(PDO::FETCH_BOTH)) {
		$contact = new Contact();
		$contact->Id = $row["id"];
		$contact->Company = $row["contact_company"];
		$contact->Person = $row["contact_person"];

		$contact->Position = $row["contact_position"];
		$contact->Email = $row["contact_email"];
		$contact->Mobile = $row["contact_mobile"];
		$contact->Fax = $row["contact_fax"];
		$contact->Telephone = $row["contact_telephone"];
		$contact->Country = $row["contact_country"];

		array_push($array['contact'], $contact);
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
