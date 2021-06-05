class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  belongs_to :card
  has_one :pay
end
