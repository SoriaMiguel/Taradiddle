# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  block = Block.create!(
  

    api_token: SecureRandom.uuid,
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: '1234'
    )
end




require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'exercises.csv'))

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Exercise.new
  t.name = row['name']
  t.reps = row['reps']
  t.duration_in_seconds = row['duration_in_seconds']
  t.description  = row['description']
  t.picture = row['picture']
  t.save!
end
