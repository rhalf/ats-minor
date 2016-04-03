var sessionUser = null;
var ats = null;

function Ats() {
	this.ListUser = null;
	this.ListCompany = null;
	this.ListBusinessField = null;
	this.ListStatus = null;
	this.ListUserLogType= null;
	this.ListProductOffered = null;
	this.ListUserLog = null;
	this.ListContact = null;
	this.ListCountry = null;
	this.ListAddressCompany = null;

	this.ListProduct = null;
	this.ListClientResponse = null;
	this.ListPrivilege = null;


	this.loadUser = function(object, callback) {
		$.post('application/model/service/user_select.php', function(json) {
			object.ListUser = json.user;  
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadCompany = function(object, callback) {
		$.post('application/model/service/company_select.php', function(json) {
			object.ListCompany = json.company;    
			if( callback != null ){ callback(); };              
		},'json');
	};
	this.loadBusinessField = function(object, callback) {
		$.post('application/model/service/business_field_select.php', function(json) {
			object.ListBusinessField = json.businessfield;
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadStatus = function(object, callback) {
		$.post('application/model/service/status_select.php', function(json) {
			object.ListStatus = json.status; 
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadUserLogType = function(object, callback) {
		$.post('application/model/service/user_log_type_select.php', function(json) {
			object.ListUserLogType = json.userLogType;    
			if( callback != null ){ callback(); };             
		},'json');
	};
	this.loadProductOffered = function(object, callback) {
		$.post('application/model/service/product_offered_select.php', function(json) {
			object.ListProductOffered = json.productoffered;
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadUserLog = function(object, callback) {
		$.post('application/model/service/user_log_select.php', function(json) {
			object.ListUserLog = json.userlog;
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadContact = function(object, callback) {
		$.post('application/model/service/contact_select.php', function(json) {
			object.ListContact = json.contact;
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadListCountry = function(object, callback) {
		$.post('application/model/service/country_select.php', function(json) {
			object.ListCountry = json.country;   
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadProduct = function(object, callback) {
		$.post('application/model/service/product_select.php', function(json) {
			object.ListProduct = json.product;   
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadClientResponse = function(object, callback) {
		$.post('application/model/service/client_response_select.php', function(json) {
			object.ListClientResponse = json.clientResponse;      
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadPrivilege = function(object, callback) {
		$.post('application/model/service/privilege_select.php', function(json) {
			object.ListPrivilege = json.privilege;  
			if( callback != null ){ callback(); };
		},'json');
	};
	this.loadAddressCompany = function(object, callback) {
		$.post('application/model/service/address_company_select.php', function(json) {
			object.ListAddressCompany = json.addressCompany;  
			if( callback != null ){ callback(); };
		},'json');
	};

	this.getObject = function(jsonArray, id) {
		for(var index = 0; index < jsonArray.length; index++) {
			if (jsonArray[index].Id == id) {
				return jsonArray[index];
			}
		}
	};

	this.load = function(callback) {
		var count = 0;
		var maxCount = 13;

		this.loadUser(this, function() {
			count++;
		});
		this.loadCompany(this, function() {
			count++;
		});
		this.loadBusinessField(this, function() {
			count++;
		});
		this.loadStatus(this, function() {
			count++;
		});
		this.loadUserLogType(this, function() {
			count++;
		});
		this.loadProductOffered(this, function() {
			count++;
		});
		this.loadUserLog(this, function() {
			count++;
		});
		this.loadContact(this, function() {
			count++;
		});
		this.loadListCountry(this, function() {
			count++;
		});
		this.loadProduct(this, function() {
			count++;
		});
		this.loadClientResponse( this, function() {
			count++;
		});
		this.loadPrivilege(this, function() {
			count++;
		});
		this.loadAddressCompany(this, function() {
			count++;
		});

		var progressBar = new ProgressBar();
		var interval = setInterval(function() {
			progressBar.setData("Loading... " + count + "/" + maxCount);
			progressBar.setValue((count / maxCount)*100);
			if (count >= maxCount) {
				if( callback != null ){ callback(); };
				progressBar.destroy();
				clearInterval(interval);
			}
		},250);
	};
}
//------------------------------------------------------------------------

// function getStatus(id) {
// 	for (var index = 0;index < globalStatus.length; index++) {
// 		if (globalStatus[index].Id == id) {
// 			return globalStatus[index];
// 		}
// 	}
// }
// function getUser(id) {
// 	for (var index = 0;index < globalUser.length; index++) {
// 		if (globalUser[index].Id == id) {
// 			return globalUser[index];
// 		}
// 	}
// }
// function getCompany(id) {
// 	for (var index = 0;index < globalCompany.length; index++) {
// 		if (globalCompany[index].Id == id) {
// 			return globalCompany[index];
// 		}
// 	}
// }
// function getContact(id) {
// 	for (var index = 0;index < globalContact.length; index++) {
// 		if (globalContact[index].Id == id) {
// 			return globalContact[index];
// 		}
// 	}
// }
// function getContactType(id) {
// 	for (var index = 0;index < globalContactType.length; index++) {
// 		if (globalContactType[index].Id == id) {
// 			return globalContactType[index];
// 		}
// 	}
// }
// function getUserLogType(id) {
// 	for (var index = 0;index < globalUserLogType.length; index++) {
// 		if (globalUserLogType[index].Id == id) {
// 			return globalUserLogType[index];
// 		}
// 	}
// }
// function getContactType(id) {
// 	for (var index = 0;index < globalContactType.length; index++) {
// 		if (globalContactType[index].Id == id) {
// 			return globalContactType[index];
// 		}
// 	}
// }
// function getProduct(id) {
// 	for (var index = 0;index < globalProduct.length; index++) {
// 		if (globalProduct[index].Id == id) {
// 			return globalProduct[index];
// 		}
// 	}
// }
// function getPrivilege(id) {
// 	for (var index = 0;index < globalPrivilege.length; index++) {
// 		if (globalPrivilege[index].Id == id) {
// 			return globalPrivilege[index];
// 		}
// 	}
// }
// function getClientResponse(id) {
// 	for (var index = 0;index < globalClientResponse.length; index++) {
// 		if (globalClientResponse[index].Id == id) {
// 			return globalClientResponse[index];
// 		}
// 	}
// }
//------------------------------------------------------------------------
function Validate() {
	this.IsEmpty = function(data) {
		var string  = this.Trim(data);
		if (string.length > 0) {
			return false;
		} else {
			return true;
		}
	};
	this.Trim = function(data) {
		return $.trim(data);
	};
}
//------------------------------------------------------------------------
//Main
if (typeof($.session.get('user')) == 'undefined') {
	dialogLogin();
} else {
	$(function() {
		sessionUser = JSON.parse($.session.get('user'));
		ats = new Ats();
		ats.load(function() {
			$.get('application/view/layout/container.php', function(data) {
				$('body').append(data);
			})
			setInterval(function() {
				$.post('application/model/service/user_login_datetime.php',{
					Id:sessionUser.Id
				}, function(){},'json');
			},60000);
			console.log(ats);
			console.log(sessionUser);
		});
	});
}
//------------------------------------------------------------------------