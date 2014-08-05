FactoryGirl.define do

  sequence :name do |n|
    "name_#{n}"
  end

  sequence :email do |n|
    "name_#{n}@example.com"
  end

  factory :user do
    email
    password "password"
    password_confirmation "password"
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
    owner
    place
    image
  end

end
