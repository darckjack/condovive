# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
               name: 'Juan Gómez',
               email: 'admin@admin.com',
               phone: '3315118931',
               password: 'secret',
               role: :admin
)

user.save
5.times do | i |
  condo = Condo.create(
           name: Faker::Name.initials,
           address: Faker::Address.full_address
  )

  condo.save

  apartment = condo.apartments.create(name: Faker::Name.initials, apartment_number: Faker::Number.non_zero_digit)

  apartment.save

  fee = apartment.fees.create(amount: 30000, date: DateTime.now >> 1, paid: false )

  fee.save

  resident = apartment.users.create(
                                name: Faker::Name.name,
                                email: "resident_#{i}@resident.com",
                                phone: Faker::PhoneNumber.phone_number,
                                password: 'secret',
                                role: :resident
  )

  resident.save

end