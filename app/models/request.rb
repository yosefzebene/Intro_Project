class Request < ApplicationRecord
  validates :date, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  
  belongs_to :service
  belongs_to :neighbourhood
end
