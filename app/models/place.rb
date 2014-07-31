class Place < ActiveRecord::Base

  belongs_to :place_type
  geocoded_by :address
  after_validation :geocode

  delegate :name , to: :place_type , prefix: true

end
