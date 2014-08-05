class Pet < ActiveRecord::Base

  belongs_to :owner
  belongs_to :image
  has_many :reports
  belongs_to :place

  scope :lost, -> { where(name: 'chana')}

  validates :name, presence: true
  validates :owner, presence: true
  validates :comments, presence: true
  validates :image, presence: true


  # def place
  #   Place.find(place_id)
  # end

  def image_url
    Image.find(image_id).url
  end

end
