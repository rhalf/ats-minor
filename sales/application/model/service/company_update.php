<?php
include ('initialize.php');


use Core\Server;
use Core\Database;
use Core\BusinessField;
use Core\Company;
use Core\User;
use Core\Result;

$array['result'] = array();
$connection = null;

try {
	$company = new Company();
	$company->Id = $_POST['Id'];
	$company->Name = $_POST['Name'];
	$company->Description = $_POST['Description'];
	$company->BusinessField = $_POST['BusinessField'];
	$company->Status = $_POST['Status'];



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
	CALL ats.company_update(" . 
		$company->Id .",'".
		$company->Name . "','" .
		$company->Description . "'," .
		$company->Status . "," .
		$company->BusinessField . "," .
		$_SESSION['user']->Id .");";

	$query = $connection->prepare($sql);
	

	if (!$query->execute()) {
		throw new Exception($company->Name ." has not been updated!", 1);
	}

	//-------------------------------------------------------------------
	$result = new Result(Result::SUCCESS, $company->Name ." has been updated!");
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
