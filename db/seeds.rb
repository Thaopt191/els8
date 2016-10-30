
25.times do |n|
  name  = "Thaopt#{n+1}"
  email = "thaopt11-#{n+1}@railstutorial.org"
  password = "852624"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end