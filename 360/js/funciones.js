function actualizarcombustible() {

	var vehiculo = document.getElementById("vehiculo").value;
      var tipo = document.getElementById("tipo").value;
   
		//alert(vehiculo);
		//alert(tipo);
        location.href = "actualizar.asp?veh='" + document.getElementById("vehiculo").value + "'&tipo=" + document.getElementById("tipo").value ;
	
   
};
$(document).ready(function(){
	
	$(".clearfix").mouseover(function(){
          $(this).stop(true);
          $(this).clearQueue();
          $(this).animate({ backgroundColor: "#FFFFFF" },250);
		  //$(this).css("background-color","#FFF"); 
	});
	$(".clearfix").mouseout(function(){
		  $(this).stop(true);
		  $(this).clearQueue();
		  $(this).animate({ backgroundColor: "" }, 100);
		  //$(this).css("background-color","#f6f6f6"); 
	});
	$(".mws-table tbody tr").mouseover(function(){
		//$(this).css("background-color","#d2f792");
		$(this).css("background-color","#c5d52b");
	});
	$(".mws-table tbody tr").mouseout(function(){
		$(this).css("background-color","");
	});
	$("#mostrarPass").click(function(){
		//alert($(this).checked());
		if($(this).is(':checked')){
			document.getElementById("password").setAttribute("type","text");
			document.getElementById("confirmarPassword").setAttribute("type","text");
		}else{
			document.getElementById("password").setAttribute("type","password");
			document.getElementById("confirmarPassword").setAttribute("type","password");
		}
	});
	
	$(".btn").css({ opacity: 0.5 });
	$(".btn").bind('mouseover',function(){
		$(this).css({ opacity: 1 });
	});
	$(".btn").focus(function(){
		$(this).css({ opacity: 1 });
	});
	$(".btn").bind('mouseout',function(){
		$(this).css({ opacity: 0.5 });
	});
	$(".btn").focusout('mouseout',function(){
		$(this).css({ opacity: 0.5 });
	});
});
