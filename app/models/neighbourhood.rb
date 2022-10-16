class Neighbourhood < ApplicationRecord
  validates :name, presence: true
  
  belongs_to :ward
  has_many :requests
end
