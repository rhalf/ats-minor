<?php
include ('initialize.php');


use Core\Server;
use Core\Database;
use Core\User;
use Core\Result;

$array['result'] = array();
$connection = null;

try {
	$user = new User();
	$user->Id = $_POST['Id'];
	$user->Name = $_POST['Name'];
	$user->Email = ($_POST['Email']);
	$user->DateTimeExpired = ($_POST['DateTimeExpired']);
	$user->Privilege = ($_POST['Privilege']);
	$user->Status = ($_POST['Status']);

	$userId =  $_SESSION['user']->Id;
	


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

	$sql = "
	CALL ats.user_update("
		. $user->Id . ",'" 
		. $user->Name . "','" 
		. $user->DateTimeExpired . "','"
		. $user->Email . "'," 
		. $user->Privilege . ","
		. $user->Status . ","
		. $userId .
		");";


	

	$query = $connection->prepare($sql);
	
	//throw new Exception($sql);

	if (!$query->execute()) {
		throw new Exception($user->Name ."User has not been updated!", 1);
	}

	//-------------------------------------------------------------------
	$result = new Result(Result::SUCCESS, $user->Name ." has been updated!");
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
