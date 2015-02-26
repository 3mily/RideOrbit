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
  cross_street_point: {"name": "Home - 41st and Cambie (Oakridge Area)", "lat": 49.233343, "long": -123.116658}
  )

Place.create(
  user_id:1, 
  name: "Work",
  cross_street:"Abbott and W Hastings (Downtown)", 
  cross_street_point: {"name": "Work - Abbott and W Hastings (Downtown)", "lat": 49.2820030, "long": -123.1072000}
  )

Place.create(
  user_id:2, 
  name: "Home",
  cross_street:"49th and Oak (Vancouver)", 
  cross_street_point: {"name": "Home - 49th and Oak (Vancouver)","lat": 49.226557, "long": -123.128330}
  )

Place.create(
  user_id:2, 
  name: "Work",
  cross_street:"King Edward and Cambie (Vancouver)", 
  cross_street_point: {"name": "Work - King Edward and Cambie (Vancouver)","lat": 49.248910, "long": -123.115528}
  )                     

Place.create(
  user_id:3, 
  name: "Home",
  cross_street:"No 3 Rd and Cooke (Richmond)", 
  cross_street_point: {"name": "Home - No 3 Rd and Cooke (Richmond)","lat": 49.166522, "long": -123.136471}
  )

Place.create(
  user_id:3, 
  name: "Work",
  cross_street:"Seymour and Dunsmuir (Downtown)", 
  cross_street_point: {"name": "Work - Seymour and Dunsmuir (Downtown)","lat": 49.283003, "long": -123.115422}
  )

Place.create(
  user_id:4, 
  name: "Home",
  cross_street:"Westminster Hwy and Garden City Rd (Richmond)", 
  cross_street_point: {"name": "Home - Westminster Hwy and Garden City Rd (Richmond)","lat": 49.170068, "long": -123.124516}
  )

Place.create(
  user_id:4, 
  name: "Work",
  cross_street:"Nicola and Robson (Downtown)", 
  cross_street_point: {"name": "Work - Nicola and Robson (Downtown)","lat": 49.288682, "long": -123.131102}
  )

Place.create(
  user_id:4, 
  name: "Work 2",
  cross_street:"Agronomy Rd and E Mall (UBC)", 
  cross_street_point: {"name": "Work 2 - Agronomy Rd and E Mall (UBC)","lat": 49.261352, "long": -123.246944}
  )

Place.create(
  user_id:5, 
  name: "Home",
  cross_street:"Cooke and Garden City Rd (Richmond)", 
  cross_street_point: {"name": "Home - Cooke and Garden City Rd (Richmond)","lat": 49.166452, "long": -123.124795}
  )

Place.create(
  user_id:5, 
  name: "Work",
  cross_street:"Wesbrook Mall and Thunderbird Blvd (UBC)", 
  cross_street_point: {"name": "Work - Wesbrook Mall and Thunderbird Blvd (UBC)","lat": 49.261669, "long": -123.241450}
  )

Place.create(
  user_id:5, 
  name: "Work 2",
  cross_street:"Seymour and Smithe (Downtown)", 
  cross_street_point: {"name": "Work 2 - Seymour and Smithe (Downtown)","lat": 49.279679, "long": -123.120421}
  )
Place.create(
  user_id:6, 
  name: "Home",
  cross_street:"Como Lake Ave and Blue Mountain (Coquitlam)", 
  cross_street_point: {"name": "Home - Como Lake Ave and Blue Mountain (Coquitlam)","lat": 49.263547, "long": -122.868766}
  )

Place.create(
  user_id:6, 
  name: "Work",
  cross_street:"37th Ave and Kersland Dr (Oakridge Area)", 
  cross_street_point: {"name": "Work - 37th Ave and Kersland Dr (Oakridge Area)","lat": 49.237140, "long": -123.114471}
  )

Place.create(
  user_id:7, 
  name: "Home",
  cross_street:"Colinet and Cottonwood (Coquitlam)", 
  cross_street_point: {"name": "Home - Colinet and Cottonwood (Coquitlam)","lat": 49.258137, "long": -122.867482}
  )

Place.create(
  user_id:7, 
  name: "Work",
  cross_street:"Lyndhurst and Willoughby (Coquitlam)", 
  cross_street_point: {"name": "Work - Lyndhurst and Willoughby (Coquitlam)","lat": 49.258856, "long": -122.895429}
  )

Place.create(
  user_id:8, 
  name: "Home",
  cross_street:"St Albans Rd and Jones Rd (Richmond)", 
  cross_street_point: {"name": "Home - St Albans Rd and Jones Rd (Richmond)","lat": 49.157374, "long": -123.130940}
  )

Place.create(
  user_id:8, 
  name: "Work",
  cross_street:"Como Lake Ave and Crestwood Dr (Coquitlam)", 
  cross_street_point: {"name": "Work - Como Lake Ave and Crestwood Dr (Coquitlam)","lat": 49.263468, "long": -122.852723}
  )

Place.create(
  user_id:9, 
  name: "Home",
  cross_street:"Cornish and 68th Ave (Vancouver)", 
  cross_street_point: {"name": "Home - Cornish and 68th Ave (Vancouver)","lat": 49.210531, "long": -123.142071}
  )

Place.create(
  user_id:9, 
  name: "Work",
  cross_street:"E Mall and Thunderbird Blvd", 
  cross_street_point: {"name": "Work - E Mall and Thunderbird Blvd","lat": 49.260103, "long": -123.245706}
  )

Place.create(
  user_id:10, 
  name: "Home",
  cross_street:"Nelson Ave and Maitland St", 
  cross_street_point: {"name": "Home - Nelson Ave and Maitland St","lat": 49.166522, "long": -123.136471}
  )

Place.create(
  user_id:10, 
  name: "Work",
  cross_street:"Schoolhouse and Austin Ave", 
  cross_street_point: {"name": "Work - Schoolhouse and Austin Ave","lat": 49.283003, "long": -123.115422}
  )
#I won't put in a drivercommute id in yet because that association
#should get made when both parties agree
Passengercommute.create(
  user_id: 1,
  origin: (49.233343, -123.116658),
  destination: (49.2820030, -123.1072000),
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"]
  )
# Passengercommute.create(
#   user_id: 2,
#   origin: {"name": "Home - 49th and Oak (Vancouver)","lat": 49.226557, "long": -123.128330},
#   destination: {"name": "Work - King Edward and Cambie (Vancouver)","lat": 49.248910, "long": -123.115528},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Passengercommute.create(
#   user_id: 3,
#   origin: {"name": "Home - No 3 Rd and Cooke (Richmond)","lat": 49.166522, "long": -123.136471},
#   destination: {"name": "Work - Seymour and Dunsmuir (Downtown)","lat": 49.283003, "long": -123.115422},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Passengercommute.create(
#   user_id: 4,
#   origin: {"name": "Home - Westminster Hwy and Garden City Rd (Richmond)","lat": 49.170068, "long": -123.124516},
#   destination: {"name": "Work - Nicola and Robson (Downtown)","lat": 49.288682, "long": -123.131102},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Passengercommute.create(
#   user_id: 5,
#   origin: {"name": "Home - Cooke and Garden City Rd (Richmond)","lat": 49.166452, "long": -123.124795},
#   destination: {"name": "Work - Wesbrook Mall and Thunderbird Blvd (UBC)","lat": 49.261669, "long": -123.241450},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Passengercommute.create(
#   user_id: 5,
#   origin: {"name": "Work - Wesbrook Mall and Thunderbird Blvd (UBC)","lat": 49.261669, "long": -123.241450},
#   destination: {"name": "Work 2 - Seymour and Smithe (Downtown)","lat": 49.279679, "long": -123.120421},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Passengercommute.create(
#   user_id: 6,
#   origin: {"name": "Home - Como Lake Ave and Blue Mountain (Coquitlam)","lat": 49.263547, "long": -122.868766},
#   destination: {"name": "Work - 37th Ave and Kersland Dr (Oakridge Area)","lat": 49.237140, "long": -123.114471},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Passengercommute.create(
#   user_id: 7,
#   origin: {"name": "Home - Colinet and Cottonwood (Coquitlam)","lat": 49.258137, "long": -122.867482},
#   destination: {"name": "Work - Lyndhurst and Willoughby (Coquitlam)","lat": 49.258856, "long": -122.895429},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Passengercommute.create(
#   user_id: 8,
#   origin: {"name": "Home - St Albans Rd and Jones Rd (Richmond)","lat": 49.157374, "long": -123.130940},
#   destination: {"name": "Work - Como Lake Ave and Crestwood Dr (Coquitlam)","lat": 49.263468, "long": -122.852723},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Passengercommute.create(
#   user_id: 9,
#   origin: {"name": "Home - Cornish and 68th Ave (Vancouver)","lat": 49.210531, "long": -123.142071},
#   destination: {"name": "Work - E Mall and Thunderbird Blvd","lat": 49.260103, "long": -123.245706},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Passengercommute.create(
#   user_id: 10,
#   origin: {"name": "Home - Nelson Ave and Maitland St","lat": 49.166522, "long": -123.136471},
#   destination: {"name": "Work - Schoolhouse and Austin Ave","lat": 49.283003, "long": -123.115422},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 1,
#   car_type: "beetle",
#   origin: {"name": "Home - 41st and Cambie (Oakridge Area)", "lat": 49.233343, "long": -123.116658},
#   destination: {"name": "Work - Abbott and W Hastings (Downtown)", "lat": 49.2820030, "long": -123.1072000},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 3,
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 2,
#   car_type: "truck",
#   origin: {"name": "Home - 49th and Oak (Vancouver)","lat": 49.226557, "long": -123.128330},
#   destination: {"name": "Work - King Edward and Cambie (Vancouver)","lat": 49.248910, "long": -123.115528},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 3,
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 3,
#   car_type: "beetle",
#   origin: {"name": "Home - No 3 Rd and Cooke (Richmond)","lat": 49.166522, "long": -123.136471},
#   destination: {"name": "Work - Seymour and Dunsmuir (Downtown)","lat": 49.283003, "long": -123.115422},
#   arrival_time: "2000-01-01 02:30:00",
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 4,
#   car_type: "SUV",
#   origin: {"name": "Home - Westminster Hwy and Garden City Rd (Richmond)","lat": 49.170068, "long": -123.124516},
#   destination: {"name": "Work - Nicola and Robson (Downtown)","lat": 49.288682, "long": -123.131102},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 3,
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 5,
#   car_type: "sports car thing",
#   origin: {"name": "Home - Cooke and Garden City Rd (Richmond)","lat": 49.166452, "long": -123.124795},
#   destination: {"name": "Work - Wesbrook Mall and Thunderbird Blvd (UBC)","lat": 49.261669, "long": -123.241450},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 3,
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 5,
#   car_type: "sports car thing",
#   origin: {"name": "Work - Wesbrook Mall and Thunderbird Blvd (UBC)","lat": 49.261669, "long": -123.241450},
#   destination: {"name": "Work 2 - Seymour and Smithe (Downtown)","lat": 49.279679, "long": -123.120421},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 3,
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 6,
#   car_type: "SUV",
#   origin: {"name": "Home - Como Lake Ave and Blue Mountain (Coquitlam)","lat": 49.263547, "long": -122.868766},
#   destination: {"name": "Work - 37th Ave and Kersland Dr (Oakridge Area)","lat": 49.237140, "long": -123.114471},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 4,
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 7,
#   car_type: "soccermomtruck",
#   origin: {"name": "Home - Colinet and Cottonwood (Coquitlam)","lat": 49.258137, "long": -122.867482},
#   destination: {"name": "Work - Lyndhurst and Willoughby (Coquitlam)","lat": 49.258856, "long": -122.895429},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 4,
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 8,
#   car_type: "beetle",
#   origin: {"name": "Home - St Albans Rd and Jones Rd (Richmond)","lat": 49.157374, "long": -123.130940},
#   destination: {"name": "Work - Como Lake Ave and Crestwood Dr (Coquitlam)","lat": 49.263468, "long": -122.852723},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 5,
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 9,
#   car_type: "4 wheels",
#   origin: {"name": "Home - Cornish and 68th Ave (Vancouver)","lat": 49.210531, "long": -123.142071},
#   destination: {"name": "Work - E Mall and Thunderbird Blvd","lat": 49.260103, "long": -123.245706},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 5,
#   days: ["Mon","Tues","Wed"]
#   )
# Drivercommute.create(
#   user_id: 10,
#   car_type: "school bus",
#   origin: {"name": "Home - Nelson Ave and Maitland St","lat": 49.166522, "long": -123.136471},
#   destination: {"name": "Work - Schoolhouse and Austin Ave","lat": 49.283003, "long": -123.115422},
#   arrival_time: "2000-01-01 02:30:00",
#   seats_available: 1,
#   days: ["Mon","Tues","Wed"]
#   )

