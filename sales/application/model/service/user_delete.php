<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Company;
use Core\Result;
use Core\User;


$array['result'] = array();

$connection = null;

try {
	$user = new User();
	if (!isset($_POST['Id']))
		throw new Exception("Id is not set.", 1);

	$user->Id = $_POST['Id'];
	$userId = $_SESSION['user']->Id;

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
			CALL ats.user_delete(".
				$user->Id .",".
				$userId.");
		";

	$query = $connection->prepare($sql);

	$query->execute();


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
