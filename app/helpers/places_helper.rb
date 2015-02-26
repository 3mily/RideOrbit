module PlacesHelper

  def places_options(places)
    result = []
    places.each do |place|
      result << [place.name, place.cross_street_point]
    end
    result
  end
end

