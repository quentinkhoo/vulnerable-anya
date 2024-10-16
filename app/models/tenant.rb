class Tenant < ApplicationRecord
  has_many :users
  has_many :gift_cards
end
