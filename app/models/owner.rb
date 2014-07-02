class Owner < ActiveRecord::Base

  has_many :pets
  validates_presence_of :email, :name



end
