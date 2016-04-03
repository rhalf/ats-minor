<?php
include ('initialize.php');



use Core\Server;
use Core\Database;
use Core\User;
use Core\Result;

$server = $_SESSION['server'];
$database = $_SESSION['database'];

$username = $_POST['Name'];
$password = $_POST['Password'];
$rememberMe = $_POST['RememberMe'];

$password = sha1($password);


$array['result'] = array();
$array['user'] = array();


$connection = null;
try {
	if ($server->Type == Server::MSSQL) {
		# MS SQL Server and Sybase with PDO_DBLIB
		$connection = new PDO("mssql:host=$server->Ip;dbname=", $user, $pass);
		$connection = new PDO("sybase:host=$server->Ip;dbname=", $user, $pass);
	} else if ($server->Type == Server::MYSQL) {
  		# MySQL with PDO_MYSQL
		$connection = new PDO("mysql:host=$server->Ip;dbname=", $database->Username, $database->Password);
	}else{
  		# SQLite Database
		$connection = new PDO("sqlite:my/database/path/database.db");
	}


	$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$connection->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);





	$sql = '
	SELECT 
	ats.user.id,
	ats.user.user_name,
	ats.user.user_password,
	ats.user.user_datetime_created,
	ats.user.user_datetime_renewed,
	ats.user.user_datetime_expired,

	ats.user.user_email,
	ats.user.user_privilege,
	ats.user.user_login_count,
	ats.user.user_login_datetime,

	ats.user.user_status

	FROM ats.user

	WHERE 
	ats.user.user_name = "' . $username . '" and
	ats.user.user_password = "'. $password .'";
	';

	//throw new Exception($sql);


	$query = $connection->prepare($sql);

	$query->execute();

	$row = $query->fetch(PDO::FETCH_BOTH);

	$user = new User();
	


	if ($row) {
		$user->Id = $row['id'];
		$user->Name = $row['user_name'];
		$user->Password = $row['user_password'];
		$user->Privilege = $row['user_privilege'];
		$user->Status = $row['user_status'];
		$user->DateTimeCreated = $row['user_datetime_created'];
		$user->DateTimeRenewed = $row['user_datetime_renewed'];
		$user->DateTimeExpired = $row['user_datetime_expired'];

		$user->Email = $row['user_email'];
		$user->LoginCount = $row['user_login_count'];
		$user->LoginDateTime = $row['user_login_datetime'];

	} else {
		throw new Exception("Username or Password is wrong.");
	}

	switch ($user->Status) {
		case 1:
		throw new Exception("Account is Disabled.");
		case 2:
		$_SESSION['user'] = $user;
		array_push($array['user'],$user);
		break;
	} 
	//-------------------------------------------------------------------
	$result = new Result(Result::SUCCESS,"Success!");
	array_push($array['result'],$result);
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
