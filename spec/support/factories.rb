FactoryGirl.define do

  sequence :name do |n|
    "name_#{n}"
  end


# Pet(id: integer, name: string, reported_as: string, comments: string, status: string, owner_id: integer, created_at: datetime, updated_at: datetime)

  factory :owner do

  end

  factory :user do

  end

  factory :image do

  end

  factory :pet do
    name
    reported_as "lost"
    comments "comments"
  end


end
