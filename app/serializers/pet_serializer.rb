class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :comments
end
