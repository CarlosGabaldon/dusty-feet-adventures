# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#


## User Data ##
unless User.exists? email: "admin@parametertechnologies.com"
  User.create! email: "admin@parametertechnologies.com", password: "password", admin: true
end

unless User.exists? email: "viewer@parametertechnologies.com"
  User.create! email: "viewer@parametertechnologies.com", password: "password"
end

## Trail Data ##
unless Trail.exists? name: "Bright Angel Trail"
  Trail.create! name: "Bright Angel Trail",
    description: "A very busy trail that runs to the river.",
    location_attributes: {lat_long_coords:  "34.575597, -112.427461", state: "AZ" }
end
