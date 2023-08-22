class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.string :title
      t.text :content
      t.integer :commentCounter
      t.integer :likesCounter

      t.timestamps
    end
  end
end
