class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :email
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :favorite_food
      t.string :favorite_artist
      t.string :company
      t.string :title
      t.string :department
      t.string :last_movie_seen
      t.string :college_degree
      t.string :college
      t.string :website
      t.string :twitter_user_name
      t.string :photo_path
      t.date :join_date

      t.timestamps
    end
  end
end
