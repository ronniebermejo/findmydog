class Place < ActiveRecord::Base
  belongs_to :place_category

  geocoded_by :address
  after_validation :geocode

end
