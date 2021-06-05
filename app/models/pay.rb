class Pay < ApplicationRecord
  belongs_to :purchase
  belongs_to :order_time
end
