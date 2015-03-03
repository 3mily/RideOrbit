# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1.upto(10) do |i|
  User.create(firstname: "firstname#{i}",lastname:"lastname#{i}",phone:"555-555#{i}",password:"pwpwpw",email:"email@email#{i}", picture: "https://avatars2.githubusercontent.com/u/3858222?v=3&s=460", bio: "Hi! My name is Emily Craig! I am related to the new James Bond! I have fat cat named Mario. I am from Victoria. I am amazing designing things. Let's go for a ride!!!") 
end


Place.create(
  user_id:1,
  name: "Home",
  cross_street:"41st and Cambie (Oakridge Area)", 
  cross_street_point: "49.233343, -123.116658"
  )

Place.create(
  user_id:1, 
  name: "Work",
  cross_street:"Abbott and W Hastings (Downtown)", 
  cross_street_point: "49.2820030, -123.1072000"
  )

Place.create(
  user_id:2, 
  name: "Home",
  cross_street:"49th and Oak (Vancouver)", 
  cross_street_point: "49.226557, -123.128330"
  )

Place.create(
  user_id:2, 
  name: "Work",
  cross_street:"King Edward and Cambie (Vancouver)", 
  cross_street_point: "49.248910, -123.115528"
  )                     

Place.create(
  user_id:3, 
  name: "Home",
  cross_street:"No 3 Rd and Cooke (Richmond)", 
  cross_street_point: "49.166522, -123.136471"
  )

Place.create(
  user_id:3, 
  name: "Work",
  cross_street:"Seymour and Dunsmuir (Downtown)", 
  cross_street_point: "49.283003, -123.115422"
  )

Place.create(
  user_id:4, 
  name: "Home",
  cross_street:"Westminster Hwy and Garden City Rd (Richmond)", 
  cross_street_point: "49.170068, -123.124516"
  )

Place.create(
  user_id:4, 
  name: "Work",
  cross_street:"Nicola and Robson (Downtown)", 
  cross_street_point: "49.288682, -123.131102"
  )

Place.create(
  user_id:4, 
  name: "Work 2",
  cross_street:"Agronomy Rd and E Mall (UBC)", 
  cross_street_point: "49.261352, -123.246944"
  )

Place.create(
  user_id:5, 
  name: "Home",
  cross_street:"Cooke and Garden City Rd (Richmond)", 
  cross_street_point: "49.166452, -123.124795"
  )

Place.create(
  user_id:5, 
  name: "Work",
  cross_street:"Wesbrook Mall and Thunderbird Blvd (UBC)", 
  cross_street_point: "49.261669, -123.241450"
  )

Place.create(
  user_id:5, 
  name: "Work 2",
  cross_street:"Seymour and Smithe (Downtown)", 
  cross_street_point: "49.279679, -123.120421"
  )
Place.create(
  user_id:6, 
  name: "Home",
  cross_street:"Como Lake Ave and Blue Mountain (Coquitlam)", 
  cross_street_point: "49.263547, -122.868766"
  )

Place.create(
  user_id:6, 
  name: "Work",
  cross_street:"37th Ave and Kersland Dr (Oakridge Area)", 
  cross_street_point: "49.237140, -123.114471"
  )

Place.create(
  user_id:7, 
  name: "Home",
  cross_street:"Colinet and Cottonwood (Coquitlam)", 
  cross_street_point: "49.258137, -122.867482"
  )

Place.create(
  user_id:7, 
  name: "Work",
  cross_street:"Lyndhurst and Willoughby (Coquitlam)", 
  cross_street_point: "49.258856, -122.895429"
  )

Place.create(
  user_id:8, 
  name: "Home",
  cross_street:"St Albans Rd and Jones Rd (Richmond)", 
  cross_street_point: "49.157374, -123.130940"
  )

Place.create(
  user_id:8, 
  name: "Work",
  cross_street:"Como Lake Ave and Crestwood Dr (Coquitlam)", 
  cross_street_point: "49.263468, -122.852723"
  )

Place.create(
  user_id:9, 
  name: "Home",
  cross_street:"Cornish and 68th Ave (Vancouver)", 
  cross_street_point: "49.210531, -123.142071"
  )

Place.create(
  user_id:9, 
  name: "Work",
  cross_street:"E Mall and Thunderbird Blvd", 
  cross_street_point: "49.260103, -123.245706"
  )

Place.create(
  user_id:10, 
  name: "Home",
  cross_street:"Nelson Ave and Maitland St", 
  cross_street_point: "49.166522, -123.136471"
  )

Place.create(
  user_id:10, 
  name: "Work",
  cross_street:"Schoolhouse and Austin Ave", 
  cross_street_point: "49.283003, -123.115422"
  )
# I won't put in a drivercommute id in yet because that association
# should get made when both parties agree
Passengercommute.create(
  user_id: 1,
  origin: "49.233343, -123.116658",
  origin_name: "Home - 41st and Cambie (Oakridge Area)",
  destination: "49.2820030, -123.1072000",
  destination_name: "Work - Abbott and W Hastings (Downtown)",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 1 P Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Passengercommute.create(
  user_id: 2,
  origin_name: "Home - 49th and Oak (Vancouver)",
  origin: "49.226557, -123.128330",
  destination_name: "Work - King Edward and Cambie (Vancouver)",
  destination: "49.248910, -123.115528",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 2 P Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Passengercommute.create(
  user_id: 3,
  origin: "49.166522, -123.136471",
  origin_name: "Home - No 3 Rd and Cooke (Richmond)",
  destination: "49.283003, -123.115422",
  destination_name: "Work - Seymour and Dunsmuir (Downtown)",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 3 P Commute", email:"special@test.ca", phone: "604-802-1234"}
  )
Passengercommute.create(
  user_id: 4,
  origin: "49.170068, -123.124516",
  origin_name: "Home - Westminster Hwy and Garden City Rd (Richmond)",
  destination: "49.288682, -123.131102",
  destination_name: "Work - Nicola and Robson (Downtown)",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 4 P Commute", email:"test@test.ca", phone: "604-802-1234"}

  )
Passengercommute.create(
  user_id: 5,
  origin_name:"Home - Cooke and Garden City Rd (Richmond)",
  origin: "49.166452, -123.124795",
  destination_name: "Work - Wesbrook Mall and Thunderbird Blvd (UBC)",
  destination: "49.261669,-123.241450",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 5 P Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Passengercommute.create(
  user_id: 5,
  origin_name: "Work - Wesbrook Mall and Thunderbird Blvd (UBC)",
  origin: "49.261669, -123.241450",
  destination_name: "Work 2 - Seymour and Smithe (Downtown)",
  destination: "49.279679, -123.120421",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 5 P Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Passengercommute.create(
  user_id: 6,
  origin_name: "Home - Como Lake Ave and Blue Mountain (Coquitlam)",
  origin: "49.263547, -122.868766",
  destination_name: "Work - 37th Ave and Kersland Dr (Oakridge Area)",
  destination: "49.237140, -123.114471",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 6 P Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Passengercommute.create(
  user_id: 7,
  origin_name: "Home - Colinet and Cottonwood (Coquitlam)",
  origin: "49.258137, -122.867482",
  destination_name: "Work - Lyndhurst and Willoughby (Coquitlam)",
  destination: "49.258856, -122.895429",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 7 P Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Passengercommute.create(
  user_id: 8,
  origin_name: "Home - St Albans Rd and Jones Rd (Richmond)",
  origin: "49.157374, -123.130940",
  destination_name: "Work - Como Lake Ave and Crestwood Dr (Coquitlam)",
  destination: "49.263468, -122.852723",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 8 P Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Passengercommute.create(
  user_id: 9,
  origin_name: "Home - Cornish and 68th Ave (Vancouver)",
  origin: "49.210531, -123.142071",
  destination_name: "Work - E Mall and Thunderbird Blvd",
  destination: "49.260103, -123.245706",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 9 P Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Passengercommute.create(
  user_id: 10,
  origin_name: "Home - Nelson Ave and Maitland St",
  origin: "49.166522, -123.136471",
  destination_name: "Work - Schoolhouse and Austin Ave",
  destination: "49.283003, -123.115422",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 10 P Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 1,
  car_type: "beetle",
  origin_name: "Home - 41st and Cambie (Oakridge Area)",
  origin: "49.233343, -123.116658",
  destination_name: "Work - Abbott and W Hastings (Downtown)",
  destination: "49.2820030, -123.1072000",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 3,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 1 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 2,
  car_type: "truck",
  origin_name: "Home - 49th and Oak (Vancouver)",
  origin: "49.226557, -123.128330",
  destination_name: "Work - King Edward and Cambie (Vancouver)",
  destination: "49.248910, -123.115528",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 3,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 2 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 3,
  car_type: "beetle",
  origin_name: "Home - No 3 Rd and Cooke (Richmond)",
  origin: "49.166522, -123.136471",
  destination_name: "Work - Seymour and Dunsmuir (Downtown)",
  destination: "49.283003, -123.115422",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 3 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 4,
  car_type: "SUV",
  origin_name: "Home - Westminster Hwy and Garden City Rd (Richmond)",
  origin: "49.170068, -123.124516",
  destination_name: "Work - Nicola and Robson (Downtown)",
  destination: "49.288682, -123.131102",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 3,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 4 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 5,
  car_type: "sports car thing",
  origin_name: "Home - Cooke and Garden City Rd (Richmond)",
  origin: "49.166452, -123.124795",
  destination_name: "Work - Wesbrook Mall and Thunderbird Blvd (UBC)",
  destination: "49.261669, -123.241450",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 3,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 5 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 5,
  car_type: "sports car thing",
  origin_name: "Work - Wesbrook Mall and Thunderbird Blvd (UBC)",
  origin: "49.261669, -123.241450",
  destination_name: "Work 2 - Seymour and Smithe (Downtown)",
  destination: "49.279679, -123.120421",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 3,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 5 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 6,
  car_type: "SUV",
  origin_name: "Home - Como Lake Ave and Blue Mountain (Coquitlam)",
  origin: "49.263547, -122.868766",
  destination_name: "Work - 37th Ave and Kersland Dr (Oakridge Area)",
  destination: "49.237140, -123.114471",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 4,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 6 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 7,
  car_type: "soccermomtruck",
  origin_name: "Home - Colinet and Cottonwood (Coquitlam)",
  origin: "49.258137, -122.867482",
  destination_name: "Work - Lyndhurst and Willoughby (Coquitlam)",
  destination: "49.258856, -122.895429",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 4,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 7 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 8,
  car_type: "beetle",
  origin_name: "Home - St Albans Rd and Jones Rd (Richmond)",
  origin: "49.157374, -123.130940",
  destination_name: "Work - Como Lake Ave and Crestwood Dr (Coquitlam)",
  destination: "49.263468, -122.852723",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 5,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 8 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 9,
  car_type: "4 wheels",
  origin_name: "Home - Cornish and 68th Ave (Vancouver)",
  origin: "49.210531, -123.142071",
  destination_name: "Work - E Mall and Thunderbird Blvd",
  destination: "49.260103, -123.245706",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 5,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 9 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )
Drivercommute.create(
  user_id: 10,
  car_type: "school bus",
  origin_name: "Home - Nelson Ave and Maitland St",
  origin: "49.166522, -123.136471",
  destination_name: "Work - Schoolhouse and Austin Ave",
  destination: "49.283003, -123.115422",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 1,
  days: ["Mon","Tues","Wed"],
  user_info: {name: "User 10 D Commute", email:"test@test.ca", phone: "604-802-1234"}
  )

