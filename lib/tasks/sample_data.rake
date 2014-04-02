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
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      name = first_name + " " + last_name
      email = "example-#{n+1}@webphr.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   active: true)
      cur_user = User.last
      
      # Create PHRs
      8.times do
        date_of_birth = DateTime.new(rand(1980..1991), rand(1..12), rand(1..28))
        gender = [:Male, :Female].sample
        blood_type = [:'A+', :'A-', :'B+', :'B-', :'AB+', :'AB-', :'O+', :'O-'].sample
        health_card_no = rand(1000000000..9999999999 )

        cur_user.phrs.create!(first_name: first_name,
                          last_name: last_name,
                          date_of_birth: date_of_birth,
                          gender: gender,
                          blood_type: blood_type,
                          health_card_no: health_card_no)
        first_name = Faker::Name.first_name
        cur_phr = Phr.last

        # Create Ailments

        # Create Allergies

        # Create Appointments

        # Create Blood Glucoses

        # Create Blood Pressures

        # Create Dentals

        # Create Fitness Records
        4.times do |x|
        weight = rand(50..70)
        height = "#{x+150}"
        date = DateTime.new(2014, 3, rand(1..31))

        cur_phr.fitnesses.create!(weight: weight,
                                    height: height,
                                    date: date)
        end

        # Create Immunizations

        # Create Medications

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
          glass_od_base = [:UP, :DOWN, :IN, :OUT].sample
          glass_os_base = [:UP, :DOWN, :IN, :OUT].sample
          
          x=rand(0..1)
          if x == 1
            cont_od_pwr = rand(-50..50).to_f/10
            cont_os_pwr = rand(-50..50).to_f/10
            cont_od_bc = rand(0..100).to_f/10
            cont_os_bc = rand(0..100).to_f/10
            cont_od_dia = rand(0..150).to_f/10
            cont_os_dia = rand(0..150).to_f/10
            colour = [:Green, :Brown, :Blue].sample
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

        # Create Test Results

      end
      # Create Contacts
      15.times do
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        name = first_name + " " + last_name
        email = first_name+"."+last_name+"@webphr.org"
        phone = Faker::PhoneNumber.phone_number
        honorific = [:Mr, :Mrs, :Ms, :Miss, :Dr].sample
        cur_user.contacts.create!(name: name,
                                  phone1: phone,
                                  email: email,
                                  honorific: honorific)
      end      
    end
  end
end