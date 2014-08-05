class Report < ActiveRecord::Base
  belongs_to :pet
  belongs_to :owner
end
