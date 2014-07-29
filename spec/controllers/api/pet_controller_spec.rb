require 'spec_helper'

describe Api::PetController do

  let(:mugus) { create(:pet) }
  let(:monga) { create(:pet) }

  describe '.index' do

    it 'list all pets in json format' do

      get :index , format: :json

      pet = Hash.new
      pet1 = {"id"=>1, "name"=>"Mugus", "comments"=>"Enano"}
      pet2 = {"id"=>2, "name"=>"Monga", "comments"=>"Enana"}
      pet['pet'] = [ pet1, pet2 ]

      expect(response_json).to eq(pet)

    end

  end

end




