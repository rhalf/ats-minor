<?php
namespace Core;

class User {
	public $Id;
	public $Name;
	public $Password;
	public $Privilege;
	public $Status;
	public $DateTimeCreated;
	public $DateTimeRenewed;
	public $DateTimeExpired;

	public $Email;
	public $LoginCount;
	public $LoginDateTime;
} 

?>