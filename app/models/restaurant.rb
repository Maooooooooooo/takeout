class Restaurant < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :genre
  belongs_to :user
  has_one_attached :image
  has_many :menus,dependent: :destroy

  with_options presence: true do
    validates :restaurant_name
    validates :address
    validates :opening_hours
    validates :phone_number,format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/ }
    validates :image
  end

  with_options numericality: { other_than: 1} do
    validates :area_id
    validates :genre_id
  end
end
