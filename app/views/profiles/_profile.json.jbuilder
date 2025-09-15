json.extract! profile, :id, :name, :city, :country, :birth, :gender, :role, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
