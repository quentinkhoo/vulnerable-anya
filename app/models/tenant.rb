class Tenant < ApplicationRecord
  has_many :users
  validates :tenant_name, presence: true, uniqueness: true
end
