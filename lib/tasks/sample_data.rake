namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@webphr.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    2.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@webphr.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
      cur_user = User.last
      5.times do
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        date_of_birth = DateTime.new(rand(1900..2013), rand(1..12), rand(1..28))
        #date_of_birth = rand(1..1391661731)
        gender = (rand(0..1) == 1) ? 'Male' : 'Female'
        blood_type = (rand(0..1) == 1) ? 'A+' : 'B+'
        health_card_no = rand(1000000000..9999999999 )

        cur_user.phrs.create!(first_name: first_name,
                          last_name: last_name,
                          date_of_birth: date_of_birth,
                          gender: gender,
                          blood_type: blood_type,
                          health_card_no: health_card_no)
        cur_phr = Phr.first
        5.times do
          date = DateTime.new(rand(1900..2013), rand(1..12), rand(1..28))
          cur_phr.eyes.create!(date: date)
        end
      end
    end
  end
end