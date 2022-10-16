class Neighbourhood < ApplicationRecord
  belongs_to :ward
  has_many :requests
end
