class Product < ApplicationRecord
    has_many :line_items, dependent: :destroy
    belongs_to :cart
    belongs_to :line_item
    belongs_to :order
end
