<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\Contact;
use Core\Country;
use Core\Company;
use Core\Result;

$array['result'] = array();
$array['country'] = array();
$connection = null;

try {
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
	CALL ats.country_select();
	');

	$query->execute();

	

	while ($row = $query->fetch(PDO::FETCH_BOTH)) {
		$contactType = new Country();
		$contactType->Id = $row["id"];
		$contactType->Iso2 = $row["country_iso2"];
		$contactType->Iso3 = $row["country_iso3"];
		$contactType->Short = $row["country_short"];
		$contactType->Long = $row["country_long"];
		$contactType->NumberCode = $row["country_number_code"];
		$contactType->AreaCode = $row["country_area_code"];
		$contactType->UnMember = $row["country_un_member"];
		$contactType->Cct = $row["country_cct"];


		array_push($array['country'], $contactType);
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
