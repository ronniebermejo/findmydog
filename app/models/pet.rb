class Pet < ActiveRecord::Base
  belongs_to :owner
  has_many :image
  has_one :location
  validates_presence_of :name

  def image_url
    Image.where(:id => self.image_id).first.url
  end

end
