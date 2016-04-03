<div id="tabControl">
	<ul>
		
	</ul>
</div>

<script type="text/javascript">
	$('#tabControl').tabs({
		collapsible: false
	});

	$('#tabControl').delegate( "span.ui-icon-close", "click", function() {
		var panelId = $( this ).closest( "li" ).remove().attr( "aria-controls" );
		$( "#" + panelId ).remove();
		$('#tabControl').tabs( "refresh" );
	});

</script>

<style type="text/css">
	#tabControl { margin-top: 1em; }
	#tabControl li .ui-icon-close { float: left; margin: 0.4em 0.2em 0 0; cursor: pointer; }
	
</style>

