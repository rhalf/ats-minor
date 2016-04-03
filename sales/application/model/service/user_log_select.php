<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Company;
use Core\UserLog;
use Core\Result;


/*Objects included on Json*/
$array['result'] = array();
$array['userlog'] = array();
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
		CALL ats.user_log_select();');

	$query->execute();

	while($row = $query->fetch(PDO::FETCH_BOTH)) {

		$userLog = new UserLog();
		$userLog->Id = $row['id']; 
		$userLog->DateTime = $row['user_log_datetime']; 
		$userLog->User =	$row['user_log_user'];
		$userLog->TableName = $row['user_log_table_name'];
		$userLog->ItemName = $row['user_log_item_name'];
		$userLog->Type = $row['user_log_type'];
		
		array_push($array['userlog'], $userLog);
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
