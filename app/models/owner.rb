class Owner < ActiveRecord::Base

  has_many :pets
  has_many :reports
  belongs_to :user
  validates_presence_of :email, :name



end
