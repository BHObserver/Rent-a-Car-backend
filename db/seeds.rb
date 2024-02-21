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

# Create five cars
Car.create(name: 'BMW', make: 'BMW', model: 'X5', year: 2022, available: true, user_id: User.first.id, photo_url: 'https://www.dmarge.com/wp-content/uploads/2017/05/bmw1.jpg')
Car.create(name: 'Camry', make: 'Toyota', model: 'Camry', year: 2021, available: true, user_id: User.first.id, photo_url: 'https://www.tflcar.com/wp-content/uploads/2017/06/2018-toyota-camry-se-hybrid.jpg')
Car.create(name: 'Lexus', make: 'Lexus', model: 'RX', year: 2020, available: true, user_id: User.first.id, photo_url: 'https://s3.amazonaws.com/the-drive-staging/message-editor/1517819214668-img_0028.jpg')
Car.create(name: 'Mercedes', make: 'Mercedes-Benz', model: 'E-Class', year: 2019, available: true, user_id: User.first.id, photo_url: 'https://www.topgear.com/sites/default/files/images/news-article/carousel/2018/02/1d3c9d0c910f73a05672edd39ff984db/17c833_009.jpg')
Car.create(name: 'Rolls-Royce', make: 'Rolls-Royce', model: 'Phantom', year: 2018, available: true, user_id: User.first.id, photo_url: 'https://automotiveblog.co.uk/wp-content/uploads/2018/05/Rolls-Royce-Cullinan.jpg')

puts 'Cars created successfully!'
