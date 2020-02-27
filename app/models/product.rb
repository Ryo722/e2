class Product < ApplicationRecord
    scope :visible, ->(){ where(showing: true) }
    has_many :order_details
end
