class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_many :pays
end
