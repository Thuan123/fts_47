User.create!(name: "Cao-Phuong-Anh", email: "thuanbk56@gmail.com",
  password: "pa0974340719", password_confirmation: "pa0974340719",
  admin: true)

User.create!(email: "thetoan@gmail.com", password: "12345678", admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password, admin: false)
end

Category.create!(name: "PHP and MySQL")
Category.create!(name: "Git")
Category.create!(name: "Ruby On Rails")
Category.create!(name: "Android")
Category.create!(name: "Java")
