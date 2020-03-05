class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  has_many :products, dependent: :destroy

  def total_price
    product.price * quantity
  end
end
