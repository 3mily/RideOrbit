# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1.upto(10) do |i|
  User.create(firstname: "firstname#{i}",lastname:"lastname#{i}",phone:"555-555#{i}",password:"pwpwpw",email:"email@email#{i}") 
end


Place.create(
  user_id:1,
  name: "Home",
  cross_street:"41st and Cambie (Oakridge Area)", 
  cross_street_point: {"lat": 49.233343, "long": -123.116658}
  )

Place.create(
  user_id:1, 
  name: "Work",
  cross_street:"Abbott and W Hastings (Downtown)", 
  cross_street_point: {"lat": 49.2820030, "long": -123.1072000}
  )

Place.create(
  user_id:2, 
  name: "Home",
  cross_street:"49th and Oak (Vancouver)", 
  cross_street_point: {"lat": 49.226557, "long": -123.128330}
  )

Place.create(
  user_id:2, 
  name: "Work",
  cross_street:"King Edward and Cambie (Vancouver)", 
  cross_street_point: {"lat": 49.248910, "long": -123.115528}
  )                     

Place.create(
  user_id:3, 
  name: "Home",
  cross_street:"No 3 Rd and Cooke (Richmond)", 
  cross_street_point: {"lat": 49.166522, "long": -123.136471}
  )

Place.create(
  user_id:3, 
  name: "Work",
  cross_street:"Seymour and Dunsmuir (Downtown)", 
  cross_street_point: {"lat": 49.283003, "long": -123.115422}
  )

Place.create(
  user_id:4, 
  name: "Home",
  cross_street:"Westminster Hwy and Garden City Rd (Richmond)", 
  cross_street_point: {"lat": 49.170068, "long": -123.124516}
  )

Place.create(
  user_id:4, 
  name: "Work",
  cross_street:"Nicola and Robson (Downtown)", 
  cross_street_point: {"lat": 49.288682, "long": -123.131102}
  )

Place.create(
  user_id:4, 
  name: "Work 2",
  cross_street:"Agronomy Rd and E Mall (UBC)", 
  cross_street_point: {"lat": 49.261352, "long": -123.246944}
  )

Place.create(
  user_id:5, 
  name: "Home",
  cross_street:"Cooke and Garden City Rd (Richmond)", 
  cross_street_point: {"lat": 49.166452, "long": -123.124795}
  )

Place.create(
  user_id:5, 
  name: "Work",
  cross_street:"Wesbrook Mall and Thunderbird Blvd (UBC)", 
  cross_street_point: {"lat": 49.261669, "long": -123.241450}
  )

Place.create(
  user_id:5, 
  name: "Work 2",
  cross_street:"Seymour and Smithe (Downtown)", 
  cross_street_point: {"lat": 49.279679, "long": -123.120421}
  )
Place.create(
  user_id:6, 
  name: "Home",
  cross_street:"Como Lake Ave and Blue Mountain (Coquitlam)", 
  cross_street_point: {"lat": 49.263547, "long": -122.868766}
  )

Place.create(
  user_id:6, 
  name: "Work",
  cross_street:"37th Ave and Kersland Dr (Oakridge Area)", 
  cross_street_point: {"lat": 49.237140, "long": -123.114471}
  )

Place.create(
  user_id:7, 
  name: "Home",
  cross_street:"Colinet and Cottonwood (Coquitlam)", 
  cross_street_point: {"lat": 49.258137, "long": -122.867482}
  )

Place.create(
  user_id:7, 
  name: "Work",
  cross_street:"Lyndhurst and Willoughby (Coquitlam)", 
  cross_street_point: {"lat": 49.258856, "long": -122.895429}
  )

Place.create(
  user_id:8, 
  name: "Home",
  cross_street:"St Albans Rd and Jones Rd (Richmond)", 
  cross_street_point: {"lat": 49.157374, "long": -123.130940}
  )

Place.create(
  user_id:8, 
  name: "Work",
  cross_street:"Como Lake Ave and Crestwood Dr (Coquitlam)", 
  cross_street_point: {"lat": 49.263468, "long": -122.852723}
  )

Place.create(
  user_id:9, 
  name: "Home",
  cross_street:"Cornish and 68th Ave (Vancouver)", 
  cross_street_point: {"lat": 49.210531, "long": -123.142071}
  )

Place.create(
  user_id:9, 
  name: "Work",
  cross_street:"E Mall and Thunderbird Blvd", 
  cross_street_point: {"lat": 49.260103, "long": -123.245706}
  )

Place.create(
  user_id:10, 
  name: "Home",
  cross_street:"No 3 Rd and Cooke", 
  cross_street_point: {"lat": 49.166522, "long": -123.136471}
  )

Place.create(
  user_id:10, 
  name: "Work",
  cross_street:"Seymour and Dunsmuir", 
  cross_street_point: {"lat": 49.283003, "long": -123.115422}
  )

