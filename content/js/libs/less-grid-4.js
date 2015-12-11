/* 
	less grid v4.0 - For Less Framework 4.
	(c) Arnau March http://arnaumarch.com/en/lessgrid.html, freely distributable under the terms of the MIT license.
*/

$(document).ready(function() {
	createSwitch();
});

function createGrid () {
	$('body').append('<div id="less-grid"></div>');
	var pageWidth = $('main').children(':first').width();
	var pageLeft = ($('body').width() - pageWidth) / 2;

  $('#less-grid').css({ 
							width: pageWidth,
							position: "fixed",
							top: "0",
							bottom: "0",
							zIndex: 900,
							left: pageLeft
	});

	var colWidth = 68;
	var colSep = 24;
	var colCount = 1;
	for(colLeft=0;colLeft<=pageWidth;colLeft=(colWidth+colSep)*(colCount-1)){
		$('#less-grid').append('<span class="col col-'+colCount+'">&nbsp;col:&nbsp;'
		+colCount+'<br/>&nbsp;w:&nbsp;'+(((colWidth+colSep)*colCount)-colSep)+'</span>'); 
		$('#less-grid .col-'+colCount).css({ 
								width: colWidth,
								position: "absolute",
								top: "0",
								left: colLeft,
								bottom: "0",
								background: "#3d5fa3",
								opacity: 0.5,
								color: "#fff",
                fontFamily: "Arial, sans-serif",
								fontSize: "11px",
                fontWeight: "bold",
								paddingTop: "33px"
		});
		colCount++;
	};
}

function createSwitch () {
	$('body').append('<span id="less-grid-switch">Show Grid</span>');
	$('#less-grid-switch').css({ 
							position: "fixed",
							bottom: "0",
							right: "10px",
							background: "#333",
							color: "#eee",
              fontFamily: "Arial, sans-serif",
							fontSize: "12px",
              fontWeight: "bold",
							padding: "5px 15px",
							cursor: "pointer",
							zIndex: 1000
							
	});
	$('#less-grid-switch').toggle(function() {
		$(this).text("Hide Grid");
		$('#less-grid').show();
		$(this).attr('rel','on');
		$('#less-grid').remove();
		createGrid();	
	}, function() {
		$(this).text('Show Grid');
		$('#less-grid').hide();
		$(this).attr('rel','off');
	});
	
}

$(function(){
	$(window).resize(function(){
		if($('#less-grid-switch').attr('rel')=="on") {
			$('#less-grid').remove();
			createGrid();
		}
	 });
});
