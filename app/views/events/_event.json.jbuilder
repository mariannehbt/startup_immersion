json.extract! event, :id, :title, :start_datetime, :duration, :description, :short_location, :adress, :zip_code, :city, :created_at, :updated_at
json.url event_url(event, format: :json)
