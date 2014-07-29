require 'spec_helper'

describe 'GET /api/pet/:id' do

  it 'returns a pet by :id' do

    pet = create(:pet)
    get "/api/pet/#{pet.id}"
    p response_json
    expect(response_json).to eq(
      {
          "pet" => { "id" => pet.id,
                     "name" => pet.name,
                     "comments" => pet.comments,
                     "status" => nil,
                     "owner" => nil
          }
      }
    )

  end

end

describe 'POST /api/pet' do
  it 'saves the pet:  name, status, owner, comments' do

    post '/api/pet/', {
        name: 'Ronnie',
        reported_as: "lost",
        owner: { name: 'ronnie', phone_number: '1111' }
    }.to_json, { 'Content-Type' => 'application/json' }

    pet = Pet.last
    expect(response_json).to eq({ 'id' => pet.id })
    expect(pet.name).to eq 'Ronnie'
    expect(pet.owner).to eq ""
  end
end
