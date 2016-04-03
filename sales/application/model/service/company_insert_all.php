<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\BusinessField;
use Core\Company;
use Core\AddressCompany;
use Core\Result;
use Core\User;
use Core\Contact;



$array['result'] = array();

$connection = null;

try {
	$company = new Company();
	$addressCompany = new AddressCompany();
	$contact = new Contact();



	if (!isset($_POST['Name']))
		throw new Exception("Name is not set.", 1);
	if (!isset($_POST['Description']))
		throw new Exception("Description is not set.", 1);
	if (!isset($_POST['BusinessField']))
		throw new Exception("BusinessField is not set.", 1);

	if (!isset($_POST['AddressArea']))
		throw new Exception("AddressArea is not set.", 1);
	if (!isset($_POST['AddressCity']))
		throw new Exception("AddressCity is not set.", 1);
	if (!isset($_POST['AddressCountry']))
		throw new Exception("AddressCountry is not set.", 1);

	if (!isset($_POST['AddressDetail']))
		throw new Exception("AddressDetail is not set.", 1);
	if (!isset($_POST['AddressLatitude']))
		throw new Exception("AddressLatitude is not set.", 1);
	if (!isset($_POST['AddressLongitude']))
		throw new Exception("AddressLongitude is not set.", 1);
	
	if (!isset($_POST['ContactPerson']))
		throw new Exception("ContactPerson is not set.", 1);
	if (!isset($_POST['ContactMobile']))
		throw new Exception("ContactMobile is not set.", 1);
	if (!isset($_POST['ContactTelephone']))
		throw new Exception("ContactTelephone is not set.", 1);
	if (!isset($_POST['ContactEmail']))
		throw new Exception("ContactEmail is not set.", 1);
	if (!isset($_POST['ContactFax']))
		throw new Exception("ContactFax is not set.", 1);

	$userId =  $_SESSION['user']->Id;

	$company->Name = $_POST['Name'];
	$company->Description = $_POST['Description'];
	$company->AddedBy =
	$company->BusinessField = $_POST['BusinessField'];
	$company->Status = 2;
	
	$addressCompany->Detail = $_POST['AddressDetail'];
	$addressCompany->Area = $_POST['AddressArea'];
	$addressCompany->City = $_POST['AddressCity'];
	$addressCompany->Country = $_POST['AddressCountry'];

	$addressCompany->Latitude = $_POST['AddressLatitude'];
	$addressCompany->Longitude = $_POST['AddressLongitude'];

	$contact->Person = $_POST['ContactPerson'];
	$contact->Person = $_POST['ContactPosition'];
	$contact->Mobile = $_POST['ContactMobile'];
	$contact->Email = $_POST['ContactEmail'];
	$contact->Telephone = $_POST['ContactTelephone'];
	$contact->Fax = $_POST['ContactFax'];
	$contact->Country = $_POST['ContactCountry'];

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

// $connection->beginTransaction();
	
	$sql = "
	CALL ats.company_insert_all('" . 
		$company->Name . "','". 
		$company->Description . "'," . 
		$company->Status .",". 
		$company->BusinessField .",'". 

		$addressCompany->Detail . "','" .
		$addressCompany->Area . "','". 
		$addressCompany->City . "','". 
		$addressCompany->Country . "',". 

		$addressCompany->Latitude . "," . 
		$addressCompany->Longitude .",'".

		$contact->Person . "','" .
		$contact->Position . "','" .
		$contact->Email . "','" .
		$contact->Mobile . "','" .
		$contact->Telephone . "','" .
		$contact->Fax . "'," .
		$contact->Country . "," .
		$userId .");";

$query = $connection->prepare($sql);

// $connection->commit();
	//throw new Exception($sql, 1);

if (!$query->execute()) {
	throw new Exception($company->Name . " not added!", 1);
}

// ContactMobile:contactMobile,
// ContactLandline:contactLandLine,
// ContactEmail:contactEmail,
// ContactFax:contactFax
	//-------------------------------------------------------------------

$result = new Result(Result::SUCCESS,"Added new Company!");
array_push($array['result'], $result);
} catch(PDOException $pdoException) {
	// $connection->rollBack();
	$result = new Result(Result::FAILED, $pdoException->getMessage());
	array_push($array['result'], $result);
} catch(Exception $exception) {
	// $connection->rollBack();
	$result = new Result(Result::FAILED, $exception->getMessage());
	array_push($array['result'], $result);
}

$connection = null;
echo json_encode($array);
?>
