require 'spec_helper'

describe 'GET /v1/pet/:id' do

  it 'returns all pets in the db' do

    dog = create(:pet)
    cat = create(:pet)

    get "/v1/pet"

    expect(response_json.size).to eq 2
    expect(response_json[0]["id"]).to eq dog.id
    expect(response_json[1]["id"]).to eq cat.id

  end

  it 'returns a pet by :id' do

    pet = create(:pet)

    get "/v1/pet/#{pet.id}"
p response_json
    expect(response_json).to eq(
      {
       "pet" =>
          { "id" => pet.id,
            "name" => pet.name,
            "comments" => pet.comments,
            "image_url" => pet.image.url,
            #TODO Fix problem with semicolons as part of the result
            "place" => PlaceSerializer.new(pet.place).as_json[:place],
            "owner" => OwnerSerializer.new(pet.owner).as_json[:owner],
    "animal_category" => AnimalCategorySerializer.new(pet.animal_category).as_json[:animal_category]
          }
      }
    )

  end

  it 'queries the with a given criteria' do

    dog = create(:pet, name: "ronnie")
    cat = create(:pet)
    get "/v1/pet?name=ronnie"
    expect(response_json[0]["name"]).to eq("ronnie")

  end


  it 'sorts the result using the given criteria' do
    z = create(:pet, name: "z")
    d = create(:pet, name: "d")
    a = create(:pet, name: "a")
    get "/v1/pet?sort=ronnie"
    expect(response_json[0]["name"]).to eq("ronnie")
  end

end

describe 'POST /v1/pet' do


  it 'fails to save a pet due missing attributes' do
    pet = create(:pet)
    post '/v1/pet', {
        name: 'Ronnie',
        comments: 'comments',
        image: pet.image,
    }.to_json, { 'Content-Type' => 'application/json' }

    body = JSON.parse(response.body)
    message = body['message']
    expect(message).to eq "Error while saving pet"
    expect(response.status).to eq(442)
  end

  it 'saves the pet:  name, status, owner, comments' do

    post '/v1/pet', {
        name: 'Ronnie',
        comments: 'comments',
        animal_
        image_url: "/assets/perro8.jpeg",
        owner_id: 1
    }.to_json, { 'Content-Type' => 'application/json' }

    body = JSON.parse(response.body)
    errors = body['errors']


    expect(errors).to eq("")
    expect(response.status).to eq(200)
  end

end

