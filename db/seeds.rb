# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

## To re-build DB run ##
# $ rails db:drop
# $ rails db:migrate
# $ rails db:seed


## User Data ##
unless User.exists? email: "admin@parametertechnologies.com"
  User.create! email: "admin@parametertechnologies.com", password: "password", admin: true
end

unless User.exists? email: "viewer@parametertechnologies.com"
  User.create! email: "viewer@parametertechnologies.com", password: "password"
end

## Trail Data ##
unless Trail.exists? name: "Trail #332"
  route = '[{"lat": 34.549009, "lng": -112.536735},{"lat": 34.550168, "lng": -112.536752},'
  route << '{"lat": 34.550480, "lng": -112.536408},{"lat": 34.551081, "lng": -112.535954},'
  route << '{"lat": 34.551267, "lng": -112.535701},{"lat": 34.551143, "lng": -112.535205},'
  route << '{"lat": 34.550753, "lng": -112.535149},{"lat": 34.550178, "lng": -112.535351},'
  route << '{"lat": 34.549646, "lng": -112.536022},{"lat": 34.549009, "lng": -112.536735}]'

  Trail.create! name: "Trail #332",
    description: "Circle Trail #332 rises and falls over the hilly terrain of Arizona’s central highlands.",
    route: route,
    location_attributes: {lat_long_coords:  '{"lat": 34.549009, "lng": -112.536735}', state: "AZ" },
    images_attributes: [{url: "http://carlosgabaldon.files.wordpress.com/2014/02/photo-1.jpg?w=768&h=575"},
      {url: "http://carlosgabaldon.files.wordpress.com/2014/02/photo.jpg?w=768&h=575"}]
end

unless Trail.exists? name: "Thunder Mountain Trail"
  Trail.create! name: "Thunder Mountain Trail",
    description: "This fun and challenging route starts at the Thunder Mountain trailhead.",
    location_attributes: {lat_long_coords:  '{"lat": 34.872039, "lng": -111.812251}', state: "AZ" },
    images_attributes: [{url: "https://dustyfeetadventures.files.wordpress.com/2015/04/img_0289.jpg?w=768&h=576"},
      {url: "https://dustyfeetadventures.files.wordpress.com/2015/04/img_2513.jpg?w=768&h=576"}]
end
