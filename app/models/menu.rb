class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :purchases
  has_one_attached :image

  with_options presence: true do
    validates :food_name
    validates :explanation
    validates :price
    validates :image
  end
end
