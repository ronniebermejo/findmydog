class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :comments, :status, :owner
end
