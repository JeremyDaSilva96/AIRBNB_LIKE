require 'unsplash'

# Configure Unsplash
Unsplash.configure do |config|
  config.application_access_key = "SxuD5Sgr3OdOjdKqEAkSpBlik7WZascJSlmzmVGkZh4"
  config.application_secret = "gBfRKVFhW5a_Ae5822Phrn2z59r8zRO8Tv3x-kFGix0"
  config.utm_source = "AIRBNB_LIKE"
end

# Clear existing data
Flat.destroy_all

# Fetch a list of photos
photos = Unsplash::Photo.search("apartment", 1, 6) # Search for 6 apartment photos

# Create 6 flats with placeholder data
6.times do |i|
  Flat.create!(
    title: "Flat #{i+1}",
    address: "#{i+1} Sample Street",
    description: "A beautiful flat with stunning views.",
    price_per_night: rand(50..200),
    number_of_guests: rand(1..5),
    image_url: photos[i].urls.raw # Assuming photos is an array of Unsplash photos
  )
end
