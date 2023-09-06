class AddCommentsCounterAndLikesCounterToPosts < ActiveRecord::Migration[6.0]
  def up
    # Remove the duplicate columns
    remove_column :posts, :comments_counter
    remove_column :posts, :likes_counter

    # Add the correct columns with the correct data types
    add_column :posts, :comments_counter, :integer
    add_column :posts, :likes_counter, :integer
  end

  def down
    # Define the reverse migration if needed
    remove_column :posts, :comments_counter
    remove_column :posts, :likes_counter

    add_column :posts, :comments_counter, :integer
    add_column :posts, :likes_counter, :integer
  end
end

