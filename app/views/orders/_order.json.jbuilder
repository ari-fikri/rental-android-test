json.extract! order, :id, :start_date, :end_date, :car_id, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)