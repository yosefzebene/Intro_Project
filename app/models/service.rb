class Service < ApplicationRecord
  validates :service_request, presence: true

  belongs_to :category
  has_many :requests
end
