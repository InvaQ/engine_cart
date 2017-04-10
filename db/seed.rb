
Cms::Car.create!(name: 'Porsche 911', price: 90450.00 )

Cms::Car.find_or_create_by!(name: 'Porsche 911', price: 90450.00 )

Cms::Car.find_or_create_by!(name: 'Lexus LC', price: 92950.00 )

Cms::Car.find_or_create_by!(name: 'Nissan GT-R', price: 100450.00 )

Cms::Car.find_or_create_by!(name: 'Acura NSX', price: 150450.00 )

Cms::Car.find_or_create_by!(name: 'Aston Martin', price: 200450.00 )

Cms::Car.find_or_create_by!(name: 'Lamborghini', price: 203450.00 )

Cms::Car.find_or_create_by!(name: 'McLaren', price: 403450.00 )

Cms::User.find_or_create_by!(first_name: 'Bob', last_name: 'Marley', email: 'bob.marley.official@dp.ua')