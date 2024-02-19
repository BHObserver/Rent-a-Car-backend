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
Car.create(name: 'BMW', make: 'BMW', model: 'X5', year: 2022, available: true, user_id: User.first.id, photo: 'bmw.jpg')
Car.create(name: 'Camry', make: 'Toyota', model: 'Camry', year: 2021, available: true, user_id: User.first.id, photo: 'camry.jpg')
Car.create(name: 'Lexus', make: 'Lexus', model: 'RX', year: 2020, available: true, user_id: User.first.id, photo: 'lexus.jpg')
Car.create(name: 'Mercedes', make: 'Mercedes-Benz', model: 'E-Class', year: 2019, available: true, user_id: User.first.id, photo: 'mercedes.jpg')
Car.create(name: 'Rolls-Royce', make: 'Rolls-Royce', model: 'Phantom', year: 2018, available: true, user_id: User.first.id, photo: 'rolls_royce.jpg')

puts 'Cars created successfully!'
