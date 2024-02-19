# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:

# Seed Users
User.find_or_create_by!(email: 'admin@example.com') do |user|
    user.username = 'admin'
    user.password = 'password'
    user.password_confirmation = 'password'
  end

  User.find_or_create_by!(email: 'user@example.com') do |user|
    user.username = 'user'
    user.password = 'password'
    user.password_confirmation = 'password'
  end

  # Create four cars
Car.create([
  { name: 'Car 1', make: 'Toyota', model: 'Camry', year: 2020, user_id: 1 },
  { name: 'Car 2', make: 'Honda', model: 'Accord', year: 2019, user_id: 1 },
  { name: 'Car 3', make: 'Ford', model: 'Focus', year: 2018, user_id: 2 },
  { name: 'Car 4', make: 'Chevrolet', model: 'Malibu', year: 2017, user_id: 2 }
])

puts 'Cars created successfully!'
