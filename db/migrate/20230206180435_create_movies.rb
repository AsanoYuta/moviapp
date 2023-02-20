class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false, default: ""
      t.text :body
      t.float :comfort, null: false, default: 0
      t.integer :user_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
