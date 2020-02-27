class Order < ApplicationRecord
  belongs_to :user
  has_one :order_detail

  def checkout(product_id)
    build_order_detail(product_id: product_id)
    save!
  end
end
