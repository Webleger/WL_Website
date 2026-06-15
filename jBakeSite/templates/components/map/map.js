$(document).ready(function(){
	$(".customMap").each(function () {
		var divMap = $(this);
		buildMap(divMap.attr('id'), divMap.data('mapConfig'))
	})
});


function buildMap(mapId, mapProps){
	var debugString = "Map : configuration, id : " + mapId + ", startPosition : " + mapProps.startPosition + ", startZoom : " + mapProps.startZoom;
	if(mapProps.markers != undefined){
		debugString += ", number of markers : " + mapProps.markers.length;
	}
	console.log(debugString);
	
	var map = L.map(mapId).setView(stringToArray(mapProps.startPosition), mapProps.startZoom);

	L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
	    maxZoom: 19,
	    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
	}).addTo(map);
	
	if(mapProps.markers != undefined){
		for (var i=0; i < mapProps.markers.length; i++) {
			var aMarkerProp = mapProps.markers[i];
			var options = {}
			if(aMarkerProp.options != undefined){
				options =  aMarkerProp.options;
			}
			if(aMarkerProp.markerType == "marker"){
				var marker = L.marker(stringToArray(aMarkerProp.location), options).addTo(map);
			}else if(aMarkerProp.markerType == "circle"){
				if(aMarkerProp.options != undefined){
					var marker = L.circle(stringToArray(aMarkerProp.location), options).addTo(map);
				}else{
					console.log("Map : ERROR : 'options' is required for  markerType == circle");
				}
			}else if(aMarkerProp.markerType == "polygon"){
				var marker = L.polygon(stringToArray(aMarkerProp.location), options).addTo(map);
			}else{
				console.log("Map : ERROR : unsuported 'markerType' : " + aMarkerProp.markerType);
				console.log(aMarkerProp);
			}
			
			if(aMarkerProp.popup != undefined){
				marker.bindPopup(aMarkerProp.popup);
			}
		}
	}
}