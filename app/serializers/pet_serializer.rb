class PetSerializer < ActiveModel::Serializer
  has_one :owner
  has_one :place
  has_one :animal_category
  attributes :id, :name, :comments, :image_url, :place
end
