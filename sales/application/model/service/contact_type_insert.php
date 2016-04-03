<?php
include ('initialize.php');

use Core\Server;
use Core\Database;
use Core\ContactType;
use Core\Result;
use Core\User;


$array['result'] = array();
$array['contact'] = array();

$connection = null;

try {
	$contactType = new ContactType();
	
	if (!isset($_POST['Name']))
		throw new Exception("Name is not set.", 1);
	if (!isset($_POST['Description']))
		throw new Exception("Description is not set.", 1);
	if (!isset($_POST['User']))
		throw new Exception("User is not set.", 1);

	$company->Name = $_POST['Name'];
	$company->Description = $_POST['Description'];
	$company->User = $_POST['User'];

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
		INSERT INTO ats.contact_type (
    	ats.contact_type.contact_type_name,
		ats.contact_type.contact_type_description
    )
		VALUES 
	(
   		contactTypeName,
    	contactTypeDescription
    );
    
    
    CALL ats.user_log_insert(user,2,'ats.contact_type',contactTypeName);";

	$query = $connection->prepare($sql);

	if (!$query->execute()) {
		throw new Exception($company->Name . " not added!", 1);
	}
	//-------------------------------------------------------------------

$result = new Result(Result::SUCCESS,"Added new Company!");
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
