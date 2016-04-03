<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Status;
use Core\Result;
use Core\User;

$array['result'] = array();
$array['status'] = array();

$connection = null;

try {
	$status = new Status();
	
	if (!isset($_POST['Name']))
		throw new Exception("Name is not set.", 1);
	if (!isset($_POST['User']))
		throw new Exception("User is not set.", 1);

	$status->Name = $_POST['Name'];
	$status->User = $_POST['User'];

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
	INSERT INTO ats.status
	(
    ats.status.status_name
    )
    VALUES 
    (
    statusName
    );
    CALL ats.user_log_insert(user,2,'ats.status',status_name);
    ";

	$query = $connection->prepare($sql);

	if (!$query->execute()) {
		throw new Exception($status->Name . " not added!", 1);
	}
	//-------------------------------------------------------------------

$result = new Result(Result::SUCCESS,"Added new status!");
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
