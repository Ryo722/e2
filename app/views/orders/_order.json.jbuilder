json.extract! order, :id, :shipping_address, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
