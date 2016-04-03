<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\ClientResponse;
use Core\ContactType;
use Core\Company;
use Core\Result;

$array['result'] = array();
$array['clientResponse'] = array();
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
	CALL ats.client_response_select();
	');

	$query->execute();

	while ($row = $query->fetch(PDO::FETCH_BOTH)) {
		$clientResponse = new ClientResponse();
		$clientResponse->Id = $row["id"];
		$clientResponse->Name = $row["client_response_name"];
		$clientResponse->Description = $row["client_response_description"];


		array_push($array['clientResponse'], $clientResponse);
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
