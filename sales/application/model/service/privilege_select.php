<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Privilege;
use Core\Result;

$array['privilege'] = array();
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
		CALL ats.privilege_select();	
		');

	$query->execute();

	while ($row = $query->fetch(PDO::FETCH_BOTH)) {
		$privilege = new Privilege();
		$privilege->Id = $row["id"];
		$privilege->Name = $row["privilege_name"];
		$privilege->Description = $row["privilege_description"];
		array_push($array['privilege'], $privilege);
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
