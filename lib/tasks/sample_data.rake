namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@webphr.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    # Create Users
    2.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@webphr.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
      cur_user = User.last
      # Create Contacts
      10.times do
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        name = first_name + " " + last_name
        email = first_name+"."+last_name+"@webphr.org"
        phone = Faker::PhoneNumber.phone_number
        cur_user.contacts.create!(name: name,
                                  phone1: phone,
                                  email: email)
      end
      # Create PHRs
      8.times do
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        date_of_birth = DateTime.new(rand(1900..2013), rand(1..12), rand(1..28))
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
        # Create Eyes
        8.times do
          date = DateTime.new(rand(1900..2013), rand(1..12), rand(1..28))
          doctor  = "Dr. " + Faker::Name.name
          glass_od_axis = (rand(1..180))
          glass_os_axis = (rand(1..180))
          cont_od_axis = (rand(1..180))
          cont_os_axis = (rand(1..180))
          
          glass_od_sph = rand(-50..50).to_f/10
          glass_os_sph = rand(-50..50).to_f/10
          glass_od_cyl = rand(-10..10).to_f/10
          glass_os_cyl = rand(-10..10).to_f/10
          glass_od_base = (rand(0..1) == 1) ? 'UP' : 'DOWN'
          glass_os_base = (rand(0..1) == 1) ? 'IN' : 'OUT'
          
          x=rand(0..1)
          if x == 1
            cont_od_pwr = rand(-50..50).to_f/10
            cont_os_pwr = rand(-50..50).to_f/10
            cont_od_bc = rand(0..100).to_f/10
            cont_os_bc = rand(0..100).to_f/10
            cont_od_dia = rand(0..150).to_f/10
            cont_os_dia = rand(0..150).to_f/10
            colour = 'Green'
            brand = 'Optha-Lens'
            cur_phr.eyes.create!(date: date,
                                doctor: doctor,
                                glass_od_sph: glass_od_sph,
                                glass_os_sph: glass_os_sph,
                                glass_od_cyl: glass_od_cyl,
                                glass_os_cyl: glass_od_cyl,
                                glass_od_base: glass_od_base,
                                glass_os_base: glass_os_base,
                                glass_od_axis: glass_od_axis,
                                glass_os_axis: glass_os_axis,
                                cont_od_axis: cont_od_axis,
                                cont_os_axis: cont_os_axis,
                                cont_od_pwr: cont_od_pwr,
                                cont_os_pwr: cont_os_pwr,
                                cont_od_bc: cont_od_bc,
                                cont_os_bc: cont_os_bc,
                                cont_od_dia: cont_od_dia,
                                cont_os_dia: cont_os_dia,
                                cont_od_colour: colour,
                                cont_os_colour: colour,
                                cont_od_brand: brand,
                                cont_os_brand: brand)
          else
            cur_phr.eyes.create!(date: date,
                                doctor: doctor,
                                glass_od_sph: glass_od_sph,
                                glass_os_sph: glass_os_sph,
                                glass_od_cyl: glass_od_cyl,
                                glass_os_cyl: glass_od_cyl,
                                glass_od_base: glass_od_base,
                                glass_os_base: glass_os_base,
                                glass_od_axis: glass_od_axis,
                                glass_os_axis: glass_os_axis,
                                cont_od_axis: cont_od_axis,
                                cont_os_axis: cont_os_axis)
          end
        end
      end
    end
  end
end