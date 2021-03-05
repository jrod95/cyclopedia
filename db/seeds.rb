puts "Cleaning the db..."

Bicycle.destroy_all

puts "db is clean"

puts "creating ..."

user = User.new(
  email: "test@outlook.com",
  password: "test123",
  location: "lisbon",
  name: "Amanda",
  bio: "site test"
)
user.save

10.times do
  bike = Bicycle.new(
    activity: ["riding","racing","speeding"].sample, 
    brand: ["caloy","bmc","trc"].sample, 
    model: ["urban","cross","speed"].sample, 
    size: [26,24,12].sample, 
    specs: ["good","perfect","amazing"].sample, 
    gender: ["men","woman","kids"].sample, 
    pick_up: [true, false].sample, 
    price: [100, 200, 300].sample, 
    description: ["occasional","road","hybrid"].sample
  )
   bike.user = user
    bike.save
end