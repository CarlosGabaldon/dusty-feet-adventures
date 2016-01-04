## Dusty Feet Adventures

[![Build Status](https://travis-ci.org/CarlosGabaldon/dusty-feet-adventures.svg?branch=master)](https://travis-ci.org/CarlosGabaldon/dusty-feet-adventures)

http://dustyfeetadventures.com/

Trail & outdoor adventure resources (MVP)
 - Trail information
  - Name of trail => complete
  - Description of trail => complete
  - Map of trail location created from Geocode (LatLng coords) => complete
  - Images of trail => complete
  - Filtering of trails by US state => complete
  - User Authentication => complete
  - User Authorization => complete
  - Upgrade to Rails 5.0.0.beta1 => complete
  - Upload GPX file and parse track points to Trail#route => complete
  - Client side Trail map created from lat_long_coords from Trail#route => not started
  - Ajax image fields for new trails => in progress, need to merge branch: add_more_trail_images_ajax, once issue https://github.com/CarlosGabaldon/dusty-feet-adventures/issues/18 is resolved.

 - To Do
   - Admin trail map tool for creating:
      - Location geocode (lat/long) markers coords
      - Trail geocode path coords (currently using google maps to copy/paste geocodes when creating a trail)
   - CSS design of site
   - Videos of trail corresponding to GPX waypoints => not started
   - Reviews & Ratings => not started
