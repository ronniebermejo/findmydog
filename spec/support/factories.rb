FactoryGirl.define do

  sequence :name do |n|
    "name_#{n}"
  end

  sequence :email do |n|
    "name_#{n}@example.com"
  end

  factory :user do
    email { Faker::Internet.email }
    password "123456"
    password_confirmation "123456"
  end

  factory :owner do
    user
    name
    email
    phone_number "442 273 65 85"
  end

  factory :place_category do
    category "Plaza comercial"
  end

  factory :animal_category do
    category "categoria"
    animal "perro"
  end

  factory :place do
    name "Place 1"
    address 'Paseo de Bonn 373, Tejeda, Queretaro, Mx'
  end

  factory :image do
    category "principal"
    url "/assets/perro8.jpeg"
  end

  factory :pet do
    name "Pet"
    comments "Comments"
    animal_category
    owner
    place
    image
  end



end
