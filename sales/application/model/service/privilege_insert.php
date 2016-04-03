<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Result;
use Core\User;
use Core\Privilege;


$array['result'] = array();
$array['privilege'] = array();

$connection = null;

try {
	$privilege = new Privilege();
	
	if (!isset($_POST['Name']))
		throw new Exception("Privilege Name Data is not set.", 1);
	if (!isset($_POST['User']))
		throw new Exception("User is not set.", 1);
	

	$privilege->Name = $_POST['Name'];
	$privilege->User = $_POST['User'];
	


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
		INSERT INTO ats.privilege
			(
   			ats.privilege.privilege_name
    		)
    	VALUES (
    		privilegeName
    			);
    
CALL ats.user_log_insert(user,2,'ats.privilege',privilegeName);
";

	$query = $connection->prepare($sql);

	if (!$query->execute()) {
		throw new Exception($privilege->Name . " not added!", 1);
	}
	//-------------------------------------------------------------------

$result = new Result(Result::SUCCESS,"Added new privilege!");
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
