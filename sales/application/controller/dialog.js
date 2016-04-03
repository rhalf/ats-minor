function dialogLogin() {
	$.get('application/view/dynamic/login.html', function( data ) {
		var div = '<div id="dialog"></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Login",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}
function dialogLogout() {
	$.get('application/view/dynamic/logout.html', function( data ) {
		var div = '<div id="dialog"></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Logout",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}
function dialogCompanyAdd() {
	$.get('application/view/dynamic/company_insert.html', function( data ) {
		var div = '<div id="dialog"></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Add Company",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}

function dialogCompanyAddAll() {
	$.get('application/view/dynamic/company_insert_all.html', function( data ) {
		var div = '<div id="dialog"></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Quick Add",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}
function dialogCompanyUpdate(company) {
	$.get('application/view/dynamic/company_update.html', function( data ) {
		var div = '<div id="dialog"><script>var company = '+ JSON.stringify(company) + '</script></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Update Company",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}
function dialogCompanyDelete(company) {
	var div = '<div id="dialog"><div id="companyDelete"></div></div>';
	$('#dialog').remove();
	$('body').append(div);

	$('#companyDelete').append('Are you sure you want to remove this item with Id("' + company.Id + '")');

	$('#dialog').dialog({
		title: "Delete Company",
		show:  "fade",
		hide: "fade",
		height: "auto",
		width: "auto",
		buttons: 
		{ 'Ok' : function () {
			$('#dialog').dialog('close');
			$('#dialog').remove();
			$.post('application/model/service/company_delete.php',{
				Id:company.Id
			}, function(json){

				var result = json.result[0];
				if (result.Status == "SUCCESS") {
					notify(result.Message);
				} else {
					notifyError(result.Message);
				}
			}, 'json');
		}
	}
});
	$('#dialog').dialog("open");
}

function dialogProductOfferedAdd() {
	$.get('application/view/dynamic/product_offered_insert.html', function( data ) {
		var div = '<div id="dialog"></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Add Product Offered",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}
function dialogProductOfferedUpdate(productOffered) {
	$.get('application/view/dynamic/product_offered_update.html', function( data ) {
		var div = '<div id="dialog"><script>var productOffered = ' + JSON.stringify(productOffered) + ';</script></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Update Product Offered",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}
function dialogProductOfferedDelete(productOffered) {
	var div = '<div id="dialog"><div id="productOfferedDelete"></div></div>';
	$('#dialog').remove();
	$('body').append(div);

	$('#productOfferedDelete').append('Are you sure you want to remove this item with Id("' + productOffered.Id + '")');

	$('#dialog').dialog({
		title: "Delete Product Offered",
		show:  "fade",
		hide: "fade",
		height: "auto",
		width: "auto",
		buttons: 
		{ 'Ok' : function () {
				$('#dialog').dialog('close');
				$('#dialog').remove();
				$.post('application/model/service/product_offered_delete.php',{
					Id:productOffered.Id
				}, function(json){
					var result = json.result[0];
					if (result.Status == "SUCCESS") {
						notify(result.Message);
					} else {
						notifyError(result.Message);
					}
				}, 'json');
			}
		}
	});
	$('#dialog').dialog("open");
}
function dialogUserAdd() {
	$.get('application/view/dynamic/user_insert.html', function( data ) {
		var div = '<div id="dialog"></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Add User",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}
function dialogUserUpdate(user) {
	$.get('application/view/dynamic/user_update.html', function( data ) {
		var div = '<div id="dialog"><script>var user = '+ JSON.stringify(user) + '</script></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Update User",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}
function dialogUserDelete(user) {
	var div = '<div id="dialog"><div id="userDelete"></div></div>';
	$('#dialog').remove();
	$('body').append(div);

	$('#userDelete').append('Are you sure you want to remove this item with Id("' + user.Id + '")');

	$('#dialog').dialog({
		title: "Delete User",
		show:  "fade",
		hide: "fade",
		height: "auto",
		width: "auto",
		buttons: 
		{ 'Ok' : function () {
				$('#dialog').dialog('close');
				$('#dialog').remove();
				$.post('application/model/service/user_delete.php',{
					Id:user.Id
				}, function(json){
					var result = json.result[0];
					if (result.Status == "SUCCESS") {
						notify(result.Message);
					} else {
						notifyError(result.Message);
					}
				}, 'json');
			}
		}
	});
	$('#dialog').dialog("open");
}

function dialogUserUpdatePassword(user) {
	$.get('application/view/dynamic/user_update_password.html', function( data ) {
		var div = '<div id="dialog"><script>var user = '+ JSON.stringify(user) + '</script></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Update User Password",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}

function dialogAddressCompanyAdd() {
	$.get('application/view/dynamic/address_company_insert.html', function( data ) {
		var div = '<div id="dialog"></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Add Address Company",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}

function dialogAddressCompanyDelete(addressCompany) {
	var div = '<div id="dialog"><div id="userDelete"></div></div>';
	$('#dialog').remove();
	$('body').append(div);

	$('#userDelete').append('Are you sure you want to remove this item with Id("' + addressCompany.Id + '")');

	$('#dialog').dialog({
		title: "Delete User",
		show:  "fade",
		hide: "fade",
		height: "auto",
		width: "auto",
		buttons: 
		{ 'Ok' : function () {
				$('#dialog').dialog('close');
				$('#dialog').remove();
				$.post('application/model/service/address_company_delete.php',{
					Id:addressCompany.Id
				}, function(json){
					var result = json.result[0];
					if (result.Status == "SUCCESS") {
						notify(result.Message);
					} else {
						notifyError(result.Message);
					}
				}, 'json');
			}
		}
	});
	$('#dialog').dialog("open");
}


function dialogAddressCompanyUpdate(addressCompany) {
	$.get('application/view/dynamic/address_company_update.html', function( data ) {
		var div = '<div id="dialog"><script>var addressCompany = '+ JSON.stringify(addressCompany) + '</script></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Update Address Company",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}



function dialogContactAdd() {
	$.get('application/view/dynamic/contact_insert.html', function( data ) {
		var div = '<div id="dialog"></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Add Contact",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}

function dialogContactDelete(contact) {
	var div = '<div id="dialog"><div id="userDelete"></div></div>';
	$('#dialog').remove();
	$('body').append(div);

	$('#userDelete').append('Are you sure you want to remove this item with Id("' + contact.Id + '")');

	$('#dialog').dialog({
		title: "Delete Contact",
		show:  "fade",
		hide: "fade",
		height: "auto",
		width: "auto",
		buttons: 
		{ 'Ok' : function () {
				$('#dialog').dialog('close');
				$('#dialog').remove();
				$.post('application/model/service/contact_delete.php',{
					Id:contact.Id
				}, function(json){
					var result = json.result[0];
					if (result.Status == "SUCCESS") {
						notify(result.Message);
					} else {
						notifyError(result.Message);
					}
				}, 'json');
			}
		}
	});
	$('#dialog').dialog("open");
}


function dialogContactUpdate(contact) {
	$.get('application/view/dynamic/contact_update.html', function( data ) {
		var div = '<div id="dialog"><script>var contact = '+ JSON.stringify(contact) + '</script></div>';
		$('#dialog').remove();
		$('body').append(div);
		$('#dialog').html(data);
		$('#dialog').dialog({
			title: "Update Contact",
			show:  "fade",
			hide: "fade",
			height: "auto",
			width: "auto"
		});
		$('#dialog').dialog("open");
	});
}
 

//=======================================================================================
function dialogGoogleSearchAddress(company) {
	$('#dialogGoogleSearchAddress').remove();
	$('body').append('<div id="dialogGoogleSearchAddress"><script>var company = '+ JSON.stringify(company) + '</script></div>');
	$.get('application/view/dynamic/google_seach_address.html', function( data ) {
		$('#dialogGoogleSearchAddress').html(data);
		$('#dialogGoogleSearchAddress').dialog({
			title: "Get Address",
			show:  "fade",
			hide: "fade",
			height: 350,
			width: 600
		});
		$('#dialogGoogleSearchAddress').dialog("open");
	});
}


function viewCompany() {
	$.get('application/view/dynamic/company.html', function( data ) {
		$('#tabControl #companyView').remove();
		$('#tabControl #companyViewContent').remove();

		$('#tabControl').append("<div id='companyViewContent'/>");
		$('#tabControl #companyViewContent').html(data);

		$('#tabControl ul').append("<li id='companyView'><a href='#companyViewContent'>Company</a><span class='ui-icon ui-icon-close' role='presentation'></span></li>");
		$('#tabControl').tabs("refresh");
		$('#tabControl').tabs('option', 'active', -1);
	});
}
function viewContact() {
	$.get('application/view/dynamic/contact.html', function( data ) {
		$('#tabControl #contactView').remove();
		$('#tabControl #contactViewContent').remove();

		$('#tabControl').append("<div id='contactViewContent'/>");
		$('#tabControl #contactViewContent').html(data);

		$('#tabControl ul').append("<li id='contactView'><a href='#contactViewContent'>Contact</a><span class='ui-icon ui-icon-close' role='presentation'></span></li>");
		$('#tabControl').tabs("refresh");
		$('#tabControl').tabs('option', 'active', -1);
	});
}
function viewAddressCompany() {
	$.get('application/view/dynamic/address_company.html', function( data ) {
		$('#tabControl #addressCompanyView').remove();
		$('#tabControl #addressCompanyViewContent').remove();

		$('#tabControl').append("<div id='addressCompanyViewContent'/>");
		$('#tabControl #addressCompanyViewContent').html(data);

		$('#tabControl ul').append("<li id='addressCompanyView'><a href='#addressCompanyViewContent'>AddressCompany</a><span class='ui-icon ui-icon-close' role='presentation'></span></li>");
		$('#tabControl').tabs("refresh");
		$('#tabControl').tabs('option', 'active', -1);
	});
}

function viewProductsOffered() {
	$.get('application/view/dynamic/product_offered.html', function( data ) {
		$('#tabControl #productOffered').remove();
		$('#tabControl #productsOfferedContent').remove();

		$('#tabControl').append("<div id='productsOfferedContent'/>");
		$('#tabControl #productsOfferedContent').html(data);

		$('#tabControl ul').append("<li id='productOffered'><a href='#productsOfferedContent'>Products Offered</a><span class='ui-icon ui-icon-close' role='presentation'></li>");
		$('#tabControl').tabs("refresh");
		$('#tabControl').tabs('option', 'active', -1);
	});
}

function viewUser() {
	$.get('application/view/dynamic/user.html', function( data ) {
		$('#tabControl #user').remove();
		$('#tabControl #userContent').remove();

		$('#tabControl').append("<div id='userContent'/>");
		$('#tabControl #userContent').html(data);

		$('#tabControl ul').append("<li id='user'><a href='#userContent'>User</a><span class='ui-icon ui-icon-close' role='presentation'></li>");
		$('#tabControl').tabs("refresh");
		$('#tabControl').tabs('option', 'active', -1);
	});
}
function viewLog() {
	$.get('application/view/dynamic/user_log.html', function( data ) {
		$('#tabControl #userLog').remove();
		$('#tabControl #userLogContent').remove();

		$('#tabControl').append("<div id='userLogContent'/>");
		$('#tabControl #userLogContent').html(data);

		$('#tabControl ul').append("<li id='userLog'><a href='#userLogContent'>Logs</a><span class='ui-icon ui-icon-close' role='presentation'></li>");
		$('#tabControl').tabs("refresh");
		$('#tabControl').tabs('option', 'active', -1);
	});
}


// function dialogCompanyAddBusinessField() {
// 	$('body').append('<div id="dialog" style="font-size: 0.8em"></div>');
// 	$.get('forms/companyAddBusinessField.html', function( data ) {
// 		$('#dialog').html(data);
// 	});
// 	$('#dialog').dialog({
// 		title: "Add Business Field",
// 		heightStyle: "content"
// 	});
// 	$('#dialog').dialog("open");
// }
