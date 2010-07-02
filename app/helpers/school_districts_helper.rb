module SchoolDistrictsHelper
  
  def find_center_point(schools)
    # set min and max for two points
    nwLat = -90 * 1000000;
    nwLng = 180 * 1000000;
    seLat = 90 * 1000000;
    seLng = -180 * 1000000;

    # find bounding lats and lngs
    schools.each do |school|
		  nwLat = [nwLat, school.latitude.to_f].max
		  nwLng = [nwLng, school.longitude.to_f].min
		  seLat = [seLat, school.latitude.to_f].min
      seLng = [seLng, school.longitude.to_f].max
    end
    [(nwLat + seLat) / 2, (nwLng + seLng) / 2]
  end
  
  
end

