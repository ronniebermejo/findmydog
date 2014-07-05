class Owner < ActiveRecord::Base

  has_many :pets
  belongs_to :user
  validates_presence_of :email, :name



end
