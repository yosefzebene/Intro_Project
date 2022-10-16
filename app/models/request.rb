class Request < ApplicationRecord
  belongs_to :service
  belongs_to :neighbourhood
end
