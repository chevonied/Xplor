json.extract! rental, :id, :r_title, :r_description, :r_num_occupants, :r_address, :r_state, :r_city, :r_zip, :user_id, :created_at, :updated_at
json.url rental_url(rental, format: :json)
