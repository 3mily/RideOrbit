module PlacesHelper

  def places_options(places)
    result = []
    places.each do |place|
      result << [place.name, place.cross_street_point.to_json]
    end
    result
  end
end


  def places_names(places)
    name = ""
    places.each 
  end