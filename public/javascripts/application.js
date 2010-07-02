
function plot_school(lat, lng, title) {
	var latlng = new google.maps.LatLng(lat, lng);
	var marker = new google.maps.Marker({
		position: latlng, 
		map: map, 
		title:title
	  });
}