<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Company;
use Core\User;
use Core\Result;


/*Objects included on Json*/
$array['result'] = array();
$array['user'] = array();
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
		CALL ats.user_select();
		');

	$query->execute();

	while($row = $query->fetch(PDO::FETCH_BOTH)) {
		$user = new User();
		$user->Id = $row['id']; 
		$user->Name = $row['user_name']; 
		$user->Password = $row['user_password']; 
		$user->Status =	$row['user_status'];
		$user->Privilege = $row['user_privilege'];
		$user->DateTimeCreated = $row['user_datetime_created'];
		$user->DateTimeRenewed = $row['user_datetime_renewed'];
		$user->DateTimeExpired = $row['user_datetime_expired'];

		$user->Email = $row['user_email']; 
		$user->LoginCount = $row['user_login_count']; 
		$user->LoginDateTime = $row['user_login_datetime']; 

		array_push($array['user'], $user);
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
