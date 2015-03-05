# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
phone_array = ["+6048020926", "+7783231717", "+7789776806", "+6048020926", "+7783231717", "+7789776806", "+6048020926", "+7783231717", "+7789776806"]
firstname_array = ["David", "Phil", "Justin", "Hora", "Brandi", "Don", "Murat", "John", "Wandrew"]
lastname_array = ["VanDusen", "Jama", "Vaillancourt", "H.", "Candi", "Burks", "Someguy", "Chan", "Gardhouse"]
bio_array = [ "David is a sort of web dev Don Quixote, helping out wherever he's in need. He has grappled with his share of technological windmills yet continues his chivalrous fight for clean, beautiful code. That said, David is a renaissance man and pursues fine arts and music in his leisure.",
              "Philip Jama has mastered land, sea and sky, and lived in world-class cities including London, New York, Munich, and Buenos Aires. When he's not biking, drinking coffee, coding, or winning hackathons, Phil works as a software professional. His home is Vancouver, but he would rather be living on a boat or sailing across the Pacific Ocean.",
              "Justin loves software, loves travel, and is smart enough to use one love to help the other. He’s competed in numerous coding competitions with Skills Canada, medaling in Moncton, Caraquet, Fundy, and Charlottetown. He’s travelled to other places too, but how many people get to travel to PEI to code?",
              "Hora loves front-end development. But he really loves donairs. He loves them so much, in fact, that he made a page for them. And frankly, we don’t blame him.",
              "Brandi is one of the longest-tenured TAs @ Lighthouse, and his deep voice lends a special cadence to his code reviews. He’s also a full-stack developer who has worked with everything from ORM portals to branding agencies.",
              "Co-founder and CIO of Nickler Technologies, Don brings 17 years of software development and teaching experience. He has worked at MetroLyrics.com and Microsoft, and taught at VFS and Ladies Learning Code.",
              "Nobody knows what Murat thinks about when he strokes his beard, but it is usually followed by a burst of maniacal laughter. Coder, UNIX system administrator, product designer. Currently is the lead systems engineer at Quietly, and has previously worked at Invoke and A Thinking Ape.",
              "John founded Dayboard, a daily task management app that helps people overcome guilt and procrastination. He was previously a designer at 37signals and lead UX design at UBC Library. He competed internationally in taekwondo and represented Team Canada twice at the World University Games.",
              "Wandrew is a former Whistler ski bum and graduate of the October Cohort. Now he is our resident Web Janitor, making sure our website remains spic and span. That title doesn’t do him justice though – he builds us killer back-end features, and does it with infectious enthusiasm."]

1.upto(9) do |i|
  firstname = firstname_array[i-1]
  lastname = lastname_array[i-1]
  industry_array = ["agriculture","energy","entertainment","finance","government","health/medical","hospitality","marketing/communications","non-profit","publishing","science","technology","transportation"]
  industry = industry_array[rand(0...industry_array.length)]
  user = User.new(firstname: firstname, lastname: lastname, phone: phone_array[i-1], password:"pwpwpw", email:"email#{i}@email.io", industry: industry, bio: bio_array[i-1]) 
  user.picture = File.open(Rails.root.join('public', "#{i}.jpg"))
  user.save!
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
  cross_street:"Abbott and W Hastings", 
  cross_street_point: "49.282251, -123.107195"
  )

Passengercommute.create(
  user_id: 1,
  origin: "49.233343, -123.116658",
  origin_name: "Home - 41st and Cambie (Oakridge Area)",
  destination: "49.282251, -123.107195",
  destination_name: "Work - Abbott and W Hastings (Downtown)",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(1).firstname, picture: User.find(1).picture, industry: User.find(1).industry, phone: phone_array[0]}
  )

Drivercommute.create(
  user_id: 1,
  car_type: "Beetle",
  origin_name: "Home - 41st and Cambie (Oakridge Area)",
  origin: "49.233343, -123.116658",
  destination_name: "Work - Abbott and W Hastings (Downtown)",
  destination: "49.282251, -123.107195",
  arrival_time: "2000-01-01 02:30:00",
  seats_available: 3,
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(1).firstname, picture: User.find(1).picture, industry: User.find(1).industry, phone: phone_array[0]}
  )

Place.create(
  user_id:2, 
  name: "Home",
  cross_street:"57th and Oak", 
  cross_street_point: "49.219391, -123.128614"
  )

Place.create(
  user_id:2, 
  name: "Work",
  cross_street:"Howe and Drake", 
  cross_street_point: "49.276960, -123.128770"
  )

Passengercommute.create(
  user_id: 2,
  origin: "49.219391, -123.128614",
  origin_name: "Home - 57th and Oak",
  destination: "49.276960, -123.128770",
  destination_name: "Howe and Drake",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(2).firstname, picture: User.find(2).picture, industry: User.find(2).industry, phone: phone_array[1]}
  )

Drivercommute.create(
  user_id: 2,
  origin: "49.219391, -123.128614",
  origin_name: "Home - 57th and Oak",
  destination: "49.276960, -123.128770",
  destination_name: "Howe and Drake",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(2).firstname, picture: User.find(2).picture, industry: User.find(2).industry, phone: phone_array[1]}
  )

  Place.create(
  user_id:3, 
  name: "Home",
  cross_street:"Bute and Harwood", 
  cross_street_point: "49.280591, -123.135468"
  )

Place.create(
  user_id:3, 
  name: "Work",
  cross_street:"Burrard and Pender", 
  cross_street_point: "49.286771, -123.117788"
  )

Passengercommute.create(
  user_id: 3,
  origin: "49.280591, -123.135468",
  origin_name: "Bute and Harwood",
  destination: "49.286771, -123.117788",
  destination_name: "Burrard and Pender",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(3).firstname, picture: User.find(3).picture, industry: User.find(3).industry, phone: phone_array[2]}
  )

Drivercommute.create(
  user_id: 3,
  origin: "49.280591, -123.135468",
  origin_name: "Bute and Harwood",
  destination: "49.286771, -123.117788",
  destination_name: "Burrard and Pender",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(3).firstname, picture: User.find(3).picture, industry: User.find(3).industry, phone: phone_array[2]}
  )


Place.create(
  user_id:4, 
  name: "Home",
  cross_street:"Commercial and Broadway", 
  cross_street_point: "49.262892, -123.069641"
  )

Place.create(
  user_id:4, 
  name: "Work",
  cross_street:"Quebec and 8th", 
  cross_street_point: "49.263930, -123.102960"
  )

Passengercommute.create(
  user_id: 4,
  origin: "49.262892, -123.069641",
  origin_name: "Commercial and Broadway",
  destination: "49.263930, -123.102960",
  destination_name: "Quebec and 8th",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(4).firstname, picture: User.find(4).picture, industry: User.find(4).industry, phone: phone_array[3]}
  )

Drivercommute.create(
  user_id: 4,
  origin: "49.262892, -123.069641",
  origin_name: "Commercial and Broadway",
  destination: "49.263930, -123.102960",
  destination_name: "Quebec and 8th",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(4).firstname, picture: User.find(4).picture, industry: User.find(4).industry, phone: phone_array[3]}
  )

Place.create(
  user_id:5, 
  name: "Home",
  cross_street:"Holdom and Lougheed", 
  cross_street_point: "49.264459, -122.981830"
  )

Place.create(
  user_id:5, 
  name: "Work",
  cross_street:"Curtis and Sperling", 
  cross_street_point: "49.275427, -122.964699"
  )

Passengercommute.create(
  user_id: 5,
  origin: "49.264459, -122.981830",
  origin_name: "Holdom and Lougheed",
  destination: "49.275427, -122.964699",
  destination_name: "Curtis and Sperling",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(5).firstname, picture: User.find(5).picture, industry: User.find(5).industry, phone: phone_array[4]}
  )

Drivercommute.create(
  user_id: 5,
  origin: "49.264459, -122.981830",
  origin_name: "Holdom and Lougheed",
  destination: "49.275427, -122.964699",
  destination_name: "Curtis and Sperling",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(5).firstname, picture: User.find(5).picture, industry: User.find(5).industry, phone: phone_array[4]}
  )

Place.create(
  user_id:6, 
  name: "Home",
  cross_street:"Rumble and Buller", 
  cross_street_point: "49.215050, -122.977552"
  )

Place.create(
  user_id:6, 
  name: "Work",
  cross_street:"McKay and Central", 
  cross_street_point: "49.226850, -123.005663"
  )

Passengercommute.create(
  user_id: 6,
  origin: "49.215050, -122.977552",
  origin_name: "Rumble and Buller",
  destination: "49.226850, -123.005663",
  destination_name: "McKay and Central",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(6).firstname, picture: User.find(6).picture, industry: User.find(6).industry, phone: phone_array[5]}
  )

Drivercommute.create(
  user_id: 6,
  origin: "49.215050, -122.977552",
  origin_name: "Rumble and Buller",
  destination: "49.226850, -123.005663",
  destination_name: "McKay and Central",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(6).firstname, picture: User.find(6).picture, industry: User.find(6).industry, phone: phone_array[5]}
  )

Place.create(
  user_id:7, 
  name: "Home",
  cross_street:"Blundell and Garden City", 
  cross_street_point: "49.155635, -123.125297"
  )

Place.create(
  user_id:7, 
  name: "Work",
  cross_street:"No 3 and Cook", 
  cross_street_point: "49.166760, -123.136480"
  )

Passengercommute.create(
  user_id: 7,
  origin: "49.155635, -123.125297",
  origin_name: "Blundell and Garden City",
  destination: "49.166760, -123.136480",
  destination_name: "No 3 and Cook",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(7).firstname, picture: User.find(7).picture, industry: User.find(7).industry, phone: phone_array[6]}
  )

Drivercommute.create(
  user_id: 7,
  origin: "49.155635, -123.125297",
  origin_name: "Blundell and Garden City",
  destination: "49.166760, -123.136480",
  destination_name: "No 3 and Cook",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(7).firstname, picture: User.find(7).picture, industry: User.find(7).industry, phone: phone_array[6]}
  )

Place.create(
  user_id:8, 
  name: "Home",
  cross_street:"24th and 168th", 
  cross_street_point: "49.045860, -122.757011"
  )

Place.create(
  user_id:8, 
  name: "Work",
  cross_street:"152nd and 60th", 
  cross_street_point: "49.111953, -122.801065"
  )

Passengercommute.create(
  user_id: 8,
  origin: "49.045860, -122.757011",
  origin_name: "24th and 168th",
  destination: "49.111953, -122.801065",
  destination_name: "152nd and 60th",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(8).firstname, picture: User.find(8).picture, industry: User.find(8).industry, phone: phone_array[7]}
  )

Drivercommute.create(
  user_id: 8,
  origin: "49.045860, -122.757011",
  origin_name: "24th and 168th",
  destination: "49.111953, -122.801065",
  destination_name: "152nd and 60th",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(8).firstname, picture: User.find(8).picture, industry: User.find(8).industry, phone: phone_array[7]}
  )

Place.create(
  user_id:9, 
  name: "Home",
  cross_street:"Willingdon and Deer Lake", 
  cross_street_point: "49.243125, -123.003309"
  )

Place.create(
  user_id:9, 
  name: "Work",
  cross_street:"Victoria and 49th", 
  cross_street_point: "49.225337, -123.065704"
  )

Passengercommute.create(
  user_id: 9,
  origin: "49.243125, -123.003309",
  origin_name: "Willingdon and Deer Lake",
  destination: "49.225337, -123.065704",
  destination_name: "Victoria and 49th",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(9).firstname, picture: User.find(9).picture, industry: User.find(9).industry, phone: phone_array[8]}
  )

Drivercommute.create(
  user_id: 9,
  origin: "49.243125, -123.003309",
  origin_name: "Willingdon and Deer Lake",
  destination: "49.225337, -123.065704",
  destination_name: "Victoria and 49th",
  arrival_time: "2000-01-01 02:30:00",
  days: ["Mon","Tues","Wed"],
  user_info: {name: User.find(9).firstname, picture: User.find(9).picture, industry: User.find(9).industry, phone: phone_array[8]}
  )


# I won't put in a drivercommute id in yet because that association
# should get made when both parties agree





