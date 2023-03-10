class CreateMovieComments < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_comments do |t|
      t.string :title, null: false, default: ""
      t.text :comment
      t.float :comfort, null: false, default: 0
      t.integer :user_id
      t.integer :movie_id
      t.timestamps
    end
  end
end
