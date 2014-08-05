class Image < ActiveRecord::Base
  belongs_to :pet
  validates_presence_of :url
end
