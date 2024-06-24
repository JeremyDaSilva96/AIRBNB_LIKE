require 'unsplash'
require 'faker'
require 'open-uri'

Unsplash.configure do |config|
  config.application_access_key = ENV['UNSPLASH_ACCESS_KEY']
  config.application_secret = ENV['UNSPLASH_SECRET_KEY']
  config.utm_source = "AIRBNB_LIKE"
end

Flat.destroy_all

photos = Unsplash::Photo.search("apartment", 1, 6)

6.times do |i|
  flat = Flat.new(
    title: Faker::Lorem.sentence(word_count: 3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zip_code: Faker::Address.zip_code,
    country: Faker::Address.country,
    description: Faker::Lorem.paragraph,
    price_per_night: rand(50..200),
    number_of_guests: rand(1..5)
  )

  image_url = photos[i].urls.raw
  image_file = URI.open(image_url)
  flat.photos.attach(io: image_file, filename: "photo_#{i}.jpg", content_type: 'image/jpeg')

  flat.save!
end
