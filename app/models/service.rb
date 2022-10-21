class Service < ApplicationRecord
  validates :service_request, presence: true

  belongs_to :category
  has_many :requests

  paginates_per 5
end
