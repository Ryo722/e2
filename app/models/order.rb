class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  after_commit :send_order_mail, on: :create

  def checkout(cart)
    cart.line_items.each do |line_item|
      order_details.build(product_id: line_item.product_id, quantity: line_item.quantity)
    end
    save!
  end

  def total_price
    order_details.to_a.sum { |item| item.total_price }
  end

  def total_number
    order_details.to_a.sum { |item| item.quantity }
  end

  private

  def send_order_mail
    OrderMailer.completed_mail(self).deliver
  end
end
