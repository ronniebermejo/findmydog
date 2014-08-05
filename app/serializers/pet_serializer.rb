class PetSerializer < ActiveModel::Serializer
  has_one :owner
  has_one :place
  attributes :id, :name, :comments, :image_url, :place
end
