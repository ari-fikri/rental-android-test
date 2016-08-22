json.extract! car, :id, :brand, :model, :license_plat, :fare, :created_at, :updated_at
json.url car_url(car, format: :json)