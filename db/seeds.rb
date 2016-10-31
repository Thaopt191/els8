User.create!(name:"thaopt", email: "zupiterhd@gmail.com",
							password: "852624", password_confirmation: "852624", 
							isAdmin: "true")

25.times do |n|
  name  = "Thaopt#{n+1}"
  email = "thaopt-#{n+1}@railstutorial.org"
  password = "852624"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end