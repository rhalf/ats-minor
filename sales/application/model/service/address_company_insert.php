<?php
include ('initialize.php');

use Core\Server;
use Core\Database;

use Core\AddressCompany;
use Core\Result;

$array['result'] = array();


$connection = null;

try {
	$addressCompany = new AddressCompany();
	

	$addressCompany->Company = $_POST['Company'];
	$addressCompany->Detail = $_POST['Detail'];
	$addressCompany->Area = $_POST['Area'];
	$addressCompany->City = $_POST['City'];
	$addressCompany->Country = $_POST['Country'];
	$addressCompany->Latitude = $_POST['Latitude'];
	$addressCompany->Longitude = $_POST['Longitude'];


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
	$connection->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);

	//-----------------------------------------------------------------------
	/*Query 1*/
	$sql = '
	CALL ats.address_company_insert(' . 
		$addressCompany->Company . ',"' .  
		$addressCompany->Detail . '","' . 
		$addressCompany->Area . '","' . 
		$addressCompany->City . '","' . 
		$addressCompany->Country . '","' . 
		$addressCompany->Latitude . '","' .  
		$addressCompany->Longitude .'",'.
		$userId .');';

$query = $connection->prepare($sql);

if (!$query->execute()) {
	throw new Exception($addressCompany->Name . " not added!", 1);
}

//-------------------------------------------------------------------
$result = new Result(Result::SUCCESS,"Added new Address Company!");
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
