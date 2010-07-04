
function plot_school(lat, lng, title) {
	var latlng = new google.maps.LatLng(lat, lng);
	var marker = new google.maps.Marker({
		position: latlng, 
		map: map, 
		title:title
	  });
}

// Display a dialog containing additional enrollment detail for selected grade
function show_grade_detail(enrollment_id, grade) {
	// make ajax call to get enrollment detail for school specified
	$.ajax({ 
		url: "/enrollments/" + enrollment_id + ".json", 
		success: function(response) {grade_detail_rcvd(response, grade);}
		}
	);
}

function grade_detail_rcvd(response, grade) {
	var enrollment = response.enrollment;
	var detail = "";
	detail += "<label>Male:</label>" + enrollment[grade+'_male_students'] + "<br/>";
	detail += "<label>Female:</label>" + enrollment[grade+'_female_students']  + "<br/>";
/*	detail += "<label>American Indian:</label>" + enrollment.first_grade_male_students + "<br/>";
	detail += "<label>Asian Students:</label>" + enrollment.first_grade_male_students + "<br/>";
	detail += "<label>Black Students:</label>" + enrollment.first_grade_male_students + "<br/>";
	detail += "<label>Hispanic Students:</label>" + enrollment.first_grade_male_students + "<br/>";
	detail += "<label>White Students:</label>" + enrollment.first_grade_male_students + "<br/>"; */
	
	$("#enrollment_detail").html(detail);
	
	// display enrollment detail for grade specified
	$(function() {
		$("#enrollment_detail").dialog({ title: 'Enrollment Detail for ' + titleize(grade) });
	});
}

function titleize(grade) {
	if (grade == 'first_grade') {
		return 'First Grade';
	}
	else if (grade == 'prek') {
		return 'PreK';
	}
	else if (grade == 'kindergarten') {
		return 'Kindergarten';
	}
	else if (grade == 'second_grade') {
		return 'Second Grade';
	}
	else if (grade == 'third_grade') {
		return 'Third Grade';
	}
	else if (grade == 'fourth_grade') {
		return 'Fourth Grade';
	}
	else if (grade == 'fifth_grade') {
		return 'Fifth Grade';
	}
	else if (grade == 'sixth_grade') {
		return 'Sixth Grade';
	}
	else if (grade == 'seventh_grade') {
		return 'Seventh Grade';
	}
	else if (grade == 'eigth_grade') {
		return 'Eighth Grade';
	}
	else if (grade == 'ninth_grade') {
		return 'Ninth Grade';
	}
	else if (grade == 'tenth_grade') {
		return 'Tenth Grade';
	}
	else if (grade == 'eleventh_grade') {
		return 'Eleventh Grade';
	}
	else if (grade == 'twelfth_grade') {
		return 'Twelfth Grade';
	}
	else if (grade == 'ungraded') {
		return 'Ungraded';
	}
	else {
		return grade;
	}
}