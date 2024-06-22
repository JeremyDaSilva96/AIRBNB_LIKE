require 'unsplash'
require 'faker'

Unsplash.configure do |config|
  config.application_access_key = "SxuD5Sgr3OdOjdKqEAkSpBlik7WZascJSlmzmVGkZh4"
  config.application_secret = "gBfRKVFhW5a_Ae5822Phrn2z59r8zRO8Tv3x-kFGix0"
  config.utm_source = "AIRBNB_LIKE"
end

Flat.destroy_all

photos = Unsplash::Photo.search("apartment", 1, 6) # Search for 6 apartment photos

6.times do |i|
  Flat.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zip_code: Faker::Address.zip_code,
    country: Faker::Address.country,
    description: Faker::Lorem.paragraph,
    price_per_night: rand(50..200),
    number_of_guests: rand(1..5),
    image_url: photos[i].urls.raw
  )
end
