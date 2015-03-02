module PlacesHelper

  def places_options(places)
    result = []
    places.each do |place|
      result << [place.name+" - "+place.cross_street, "#{place.name} - #{place.cross_street}, #{place.cross_street_point[0]}, #{place.cross_street_point[1]}"]
    end
    result
  end
end

