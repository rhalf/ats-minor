<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Company;
use Core\UserLogType;
use Core\Result;


/*Objects included on Json*/
$array['result'] = array();
$array['userLogType'] = array();
/*Variables*/


$connection = null;
try {
	//----------------------------------------------------------------------

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
		CALL ats.user_log_type_select();');

	$query->execute();

	while($row = $query->fetch(PDO::FETCH_BOTH)) {

		$userLogType = new UserLogType();
		$userLogType->Id = $row['id']; 
		$userLogType->Name = $row['user_log_type_name']; 
		$userLogType->Description =	$row['user_log_type_description'];
	
		
		array_push($array['userLogType'], $userLogType);
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
