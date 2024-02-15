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
  
# Seed Cars
Car.find_or_create_by!(name: 'Tesla Model S') do |car|
  car.photo = 'tesla_model_s.jpg'
  car.details = 'Electric car with advanced features'
  car.city = 'San Francisco'
  car.model = 'Model S'
  car.cost = 100
  car.user = admin
end

Car.find_or_create_by!(name: 'BMW 3 Series') do |car|
  car.photo = 'bmw_3_series.jpg'
  car.details = 'Luxury sedan with excellent performance'
  car.city = 'Los Angeles'
  car.model = '3 Series'
  car.cost = 120
  car.user = user
end

Car.find_or_create_by!(name: 'Toyota Camry') do |car|
  car.photo = 'toyota_camry.jpg'
  car.details = 'Reliable and fuel-efficient family sedan'
  car.city = 'New York'
  car.model = 'Camry'
  car.cost = 80
  car.user = admin
end
