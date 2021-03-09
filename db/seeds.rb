require "open-uri"
puts "Cleaning the db..."

Booking.destroy_all
Bicycle.destroy_all

puts "db is clean"

puts "creating ..."

#user = User.new(
  #email: "test@outlook.com",
  #password: "test123",
  #location: "lisbon",
  #name: "Amanda",
  #bio: "site test"
#)
#user.save
#puts"#{user.name}"
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
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
    description: ["occasional","road","hybrid"].sample,
    user_id: 5
  )

  #puts"#{user.name}"
  #bike.user = user
  #puts"#{bike.user}"
  bike.photo.attach(io: File.open(Rails.root + "app/assets/images/filename.png"), filename: "some-image.png", content_type: "image/png")
  #bike.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  bike.save
end