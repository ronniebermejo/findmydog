require 'spec_helper'

describe Api::PetController do

  let(:mugus) { Pet.create(name: "Mugus", comments: "Enano") }
  let(:monga) { Pet.create(name: "Monga", comments: "Enana") }

  describe '.index' do

    it 'list all pets in json format' do

      get :index , format: :json

      pet = Hash.new
      pet1 = {"id"=>1, "name"=>"Mugus", "comments"=>"Enano"}
      pet2 = {"id"=>2, "name"=>"Monga", "comments"=>"Enana"}
      pet['pet'] = [ pet1, pet2 ]

      expect(json_response).to eq(pet)

    end

  end

end




