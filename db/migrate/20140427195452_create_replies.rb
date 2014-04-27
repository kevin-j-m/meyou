class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :post, index: true
      t.text :body

      t.timestamps
    end
  end
end
