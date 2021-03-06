json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :middle_initial, :last_name, :email, :street1, :street2, :city, :state, :zip, :phone, :favorite_food, :favorite_artist, :company, :title, :department, :last_movie_seen, :college_degree, :college, :website, :twitter_user_name, :photo_path, :join_date
  json.url user_url(user, format: :json)
end
