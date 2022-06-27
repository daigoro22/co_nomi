class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.decimal :lat
      t.decimal :lng
      t.string :budget
      t.string :budget_memo
      t.string :catch
      t.string :access
      t.string :url
      t.string :logo_image
      t.string :photo
      t.string :open
      t.string :close
      t.boolean :free_drink
      t.boolean :free_food
      t.boolean :midnight
      t.integer :upvote
      t.integer :downvote
      t.string :memo

      t.timestamps
    end
  end
end
