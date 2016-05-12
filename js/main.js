var $app = { render: { rows: [] } };
var pageNum="1";

function init() {

    var hash =window.location.hash || '#signin';

    tpl = hash.split('/')[0];

    $('#container').html( $(tpl).html() );

    $('#container').fetchData();

    $('#container').prebind();

    $('#container').html( 
	Mustache.render( $(tpl).html(), $app.render )
    );

    $('#container').bind();

    $('#container table').bootstrapTable({pagination:true,pageSize:10,pageNumber:parseInt(pageNum)});

    $('.page-number').click(function() { pageNum = $(this).text(); });

    $('[data-toggle]').each(function() { 
	$(this)[$(this).data('toggle')](); 
    });
    $('.requesting').selectpicker();
    $("#inputPhone").mask("9999999999",{placeholder:"5555555555"});
}


/************************************
	pull stuff together functions here
*************************************/

/* UI */
$.fn.busBtns = function() {

}
$.fn.btns = function() {
    var last;

    $('.btn',this).click(
	function(e) {
	    e.preventDefault();
	    if ($(this).hasClass('btn-primary')) return;
	    var name=$(this).data('name');
	    $('input[name='+name+']').val( $(this).text().trim() );

	    $(this).addClass('btn-primary');
	    !!!last||$(last).removeClass('btn-primary');
	    last = this;
	}
    );

    $('.btn',this).each(function() {
	    var name=$(this).data('name');
	    var val = $('input[name='+name+']').val();
	    if (val) {
		var el = $(this).parent().find(':contains('+val+')');
		el.addClass('btn-primary');
		last = el;
	    }
    });

}

/* data re-map stuff */

$.fn.getData=function() {
    var data = {};
    $(this).find('input').each(function() {
		if ($(this).attr('name')) {
			if($(this).attr('type') == 'checkbox'){
				if($('input[type=checkbox]').is(":checked")){
					data[$('input[type=checkbox]').attr('name')]=$('input[type=checkbox]').val();
				}else{
					data[$('input[type=checkbox]').attr('name')]='no';
				}
			}else{
			    data[$(this).attr('name')]=$(this).val();
			}
		}
    });
    if($(this).find('textarea')){
		data[$('textarea').attr('name')]=$('textarea').val();
	}
	// if($(this).find('select')){
	// 	data[$('select').attr('name')]=$('select').val();
	// }
    return data;
}

$.fn.fetch = function(fetch) {
    var data = $.ajax({async:false,url:'./rest/'+fetch}).responseText;
    return JSON.parse(data);
}

$.fn.fetchData = function(get) {
    $('[data-fetchData]',this).each(function() {
	var get = $(this).data('fetchdata');
	var fetch = get.split('=')[1];
	var into = get.split('=')[0];
	var data = $.fn.fetch(fetch);
	$app.render[into]=data;
    });
}

$.fn.prebind = function() {
    $('[data-prebind]',this).each(function(n) {
	var self = this;
	$(this).data('prebind').split(',').forEach(function(f) {
	    $(self)[f]();
	});
    });
}
$.fn.bind = function() {
    $('[data-bind]',this).each(function(n) {
	var self = this;
	$(this).data('bind').split(',').forEach(function(f) {
	    if ($(self)[f]) $(self)[f]();
	});
	$(this).data('bind','');
    });
}

$.fn.goto = function(s) {
    bound=[];
    window.location.hash=s;
    init();
}

$.fn.send = function(data,route,success) {
    data.route = route;
    $.ajax({ type:'post', data:data,url:'./REST.php', success:success });
}

/* do all optiony type stuff here */

/* Login */
$.fn.loginForm = function() {
    $(this).submit(function(e) {
	if (e.isDefaultPrevented()) {

	} else {
	    $.fn.goto('addNewPatient');
	}
	e.preventDefault();
    });
}

$.fn.forgotPassword = function() {
    $(this).submit(function(e) {
	e.preventDefault();
    });
}

$.fn.confirm = function(txt,callBack,cancelBack) {
    $('#container .confirmer').remove();
    $('#container').append('<div class="confirmer"></div>');
    $('#container .confirmer').html(txt[0]);
    $('#container .confirmer').append('<a class="btn btn-default btn-confirm" href="#">'+txt[1]+'</a>');
    $('#container .confirmer').append('<a class="btn btn-default btn-cancel" href="#">Cancel</a>');
    $('.btn-confirm').click(callBack);
    $('.btn-cancel').click(function() { window.history.back(); });
}

/* Patients */
function getId() {
    return window.location.hash.split('/')[1];
}


$.fn.removePatient = function() {
    var id = getId();
    $.fn.confirm(['Are you sure you want to delete this patient?','Delete'],function() {
	$.ajax({ 
	    method: 'delete', 
	    url: './rest/patients/' + id, 
	    success: function() {
		$.fn.goto('patientList');
	    } 
	});
    });

}

/* move the patient to the bottom of the list */
$.fn.downPatient = function() {
    var id = getId();
    $.get('./rest/patients/'+id,function(data) {
	delete(data.id);

	$.ajax({ 
	    method: 'delete', 
	    url: './rest/patients/' + id, 
	    success: function() {
		$.post('./rest/patients',data);
		$.fn.goto('patientList');
	    } 
	});

    });
}
Array.prototype.min = function() {
	  return Math.min.apply(null, this);
	};
$.fn.upPatient = function() {
	var data = $.ajax({async:false,url:'./rest/patients'}).responseText;
	var obj = JSON.parse(data);
	var column = [];
    for (var i = 0, j = obj.length; i < j; i++) {
        column.push (obj[i].toporder) ;
    }	
	var min = column.min() - 1;
	var id = getId();
	$.ajax({
		method: 'put', 
		url: './rest/patients/' + id, 
		data: 'toporder='+min,
		success: function() {
		$.fn.goto('patientList');
	    } 
	})
}

$.fn.addPatient = function() {

    $(this).validator().on('submit',function(e) {
    var arrayval = [];
    arrayval = $(this).find('select').val();
    requesting = arrayval.toString();
    $('input[name="requesting"]').val(requesting);
	var formData  =  $('#addPatient').getData();
	console.log(formData);
	if (e.isDefaultPrevented()) {

	} else {
	    e.preventDefault();
	    $.post('./rest/patients/',formData,function(r) {
		//get last insert id
		$.get('./rest/patients/?order=DESC&by=id&limit=1',function(r) {
			var id = r[0].id;
		    $.get('./rest/patients/'+id,function(data) {
			var to = data.contactBy=='Email'?data.email:data.phone;

			$.post('./message/sendtext.php',{ type: data.contactBy, sendTo: to },function(res) {

 					$.fn.goto('addedPatient/'+id);
			});

		    });
		   
		});
	    });
	}
    });

}

$.fn.addedPatient = function() {
    $app.render.id=getId();
}

$.fn.patientList = function() {
    var data = $.fn.fetch('patients/seen/0?by=toporder&order=asc');
    $app.render.patientList = data;
    var data = $.fn.fetch('patients/seen/1');
    $app.render.patientSeenList = data;
};

$.fn.editPatient = function() {
    var id = getId();
    $app.render.id=id;

    var self = this;

    var data = $.fn.fetch('patients/'+id);

    Object.keys(data).forEach(function(k) {
	$('[name='+k+']',self).val( data[k] );
    });

    $app.render.history = $.fn.fetch('patientHistory/id_patient/'+id);
    $app.render.notifications = $.fn.fetch('patientNotifications/id_patient/'+id);

    $(this).submit(function(e) {
		e.preventDefault();
		var formData  =  $('#editPatientForm').getData();
		$.ajax({ 
		    method: 'put', 
		    url: './rest/patients/' + id, 
		    data: formData,
		    success: function() {
			$.fn.goto('patientList');
		    } 
		});
    });

}

$.fn.notifyPatient = function() {
    var id = getId();
    $.get('./rest/patients/'+id,function(data) {
	var to = data.contactBy=='Email'?data.email:data.phone;

	$.post('./message/',{ type: data.contactBy, sendTo: to },function(res) {
	    /* Set to seen */
	    //data.seen = 1;
	    var data = 'seen=1';
	    $.ajax({url:'./rest/patients/'+id,type:'put',data:data,success:function(data) {
		alert('Notice sent');
		window.history.back();
	    }});
	});

    });
}
//toggle status
$.fn.toSeen = function() {
	var id = getId();
	$.ajax({ 
		    method: 'put', 
		    url: './rest/patients/' + id, 
		    data: 'seen=1&status=Seen',
		    success: function() {
			  $.fn.goto('patientList');
		    } 
		});
}

$.fn.toWaiting = function() {
	var id = getId();
	$.ajax({ 
		    method: 'put', 
		    url: './rest/patients/' + id, 
		    data: 'seen=0&status=Waiting',
		    success: function() {
			$.fn.goto('patientList');
		    } 
		});
}


$.fn.setupAdminPanel = function() {
    // $app.render = $.fn.fetch('busStatus/1');
    // $app.render.busStops = [{stop:'Stop A'},{stop:'Stop B'},{stop:'Stop C'}];
    $app.render = $.fn.fetch('adminEdit/1');
}

$.fn.adminPanel = function() {
    
    var isActive = $('[name=busIsActive]').val()=='Yes';
    if (!isActive) {
	$('#editBus').find('.well:not(:first)').addClass('disabled');
	$('.disabled').find('input').attr('disabled',true);
    }

    $(this).on('submit',function(e) {
	var formData = $('#container form').getData();
	e.preventDefault();
	$.ajax({type:'put',url:'./rest/busStatus/1',data:formData,success:function(r) {
	    $.fn.goto('adminPanel');
	}});
    });

}

$.fn.adminEdit = function() {
	$(this).on('submit',function(e) {
		var formData = $('#editAdmin').getData();
		console.log(formData);
		e.preventDefault();
		$.ajax({type:'put',url:'./rest/adminEdit/1',data:formData,success:function(r) {
			alert('Updated!');
		    $.fn.goto('adminPanel');
		}});
    });
}

$.fn.busStop = function() {

    var container = $(this).parent().parent();
    var val = container.find('.dropdown-input').val();

    $('[data-name=busIsActive]').click(function() {
	var vis = ($(this).text()=='No')?false:true;

        $('#editBus').find('.well:not(:first)').removeClass('disabled');
        $('#editBus').find('.well input').removeAttr('disabled');

	if (!vis) {
	    $('#editBus').find('.well:not(:first)').addClass('disabled');
	    $('.disabled').find('input').attr('disabled',true);
	}

    });
    /* trigger disabled state if needed */
    if ( $('[name=busIsActive]').val() == 'No' ) {
	//$('[data-name=busIsActive]:first').click();
    }

    container.find('.dropdown-info').html( val );

    $(this).find('li a').click(function(e) {
	var container = $(this).parent().parent().parent();
	e.preventDefault();
	container.find('.dropdown-info').html($(this).html());
	container.find('.dropdown-input').val($(this).html());
    });

}

$.fn.bindActions = function () {
    $('.actions a',this).click(function(e) {
	e.preventDefault();
	window.location.hash = $(this).attr('href');
    });
}


/* boot system */
$(document).ready(init);
$(document).ready(function(){
    $(window).on('hashchange',init);
});

