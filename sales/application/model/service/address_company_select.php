<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Company;
use Core\AddressCompany;
use Core\Result;

/*Objects included on Json*/
$array['result'] = array();
$array['addressCompany'] = array();
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
		CALL ats.address_company_select();');

	$query->execute();

	while($row = $query->fetch(PDO::FETCH_BOTH)) {
		$addressCompany = new AddressCompany();
		$addressCompany->Id = $row['id']; 
		$addressCompany->Country = $row['address_company_country'];
		$addressCompany->City = $row['address_company_city']; 
		$addressCompany->Area = $row['address_company_area']; 

		$addressCompany->Latitude =	$row['address_company_latitude'];
		$addressCompany->Longitude = $row['address_company_longitude'];
		$addressCompany->Detail = $row['address_company_detail'];
		$addressCompany->Company = $row['address_company_company'];

		
		array_push($array['addressCompany'], $addressCompany);
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
