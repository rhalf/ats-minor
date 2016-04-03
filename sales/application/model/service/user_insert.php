<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Company;
use Core\Result;
use Core\User;

$array['result'] = array();
$array['user'] = array();

$connection = null;

try {
	$user = new User();
	
	if (!isset($_POST['Name']))
		throw new Exception("Username is not set.", 1);
	if (!isset($_POST['Password']))
		throw new Exception("Password is not set.", 1);

	if (!isset($_POST['Email']))
		throw new Exception("Email is not set.", 1);
	if (!isset($_POST['Privilege']))
		throw new Exception("Privilege is not set.", 1);
	if (!isset($_POST['Status']))
		throw new Exception("Status is not set.", 1);




	$user->Name = $_POST['Name'];
	$user->Password = sha1($_POST['Password']);
	$user->DateTimeExpired = $_POST['DateTimeExpired'];
	$user->Hash = '';
	$user->Email = ($_POST['Email']);
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
	/*Query 1*/
	$sql = "
	CALL ats.user_insert(
	'". $user->Name . "',
	'". $user->Password . "',
	'". $user->DateTimeExpired . "',
	'". $user->Hash . "',
	'". $user->Email . "',
	". $user->Privilege . ",
	". $user->Status . ",
	". $userId . "
	);";

	$query = $connection->prepare($sql);

 	//throw new Exception($sql);

if (!$query->execute()) {
	throw new Exception($user->Username . " not added!", 1);
}

//-------------------------------------------------------------------
$result = new Result(Result::SUCCESS,"Added new User!");
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
