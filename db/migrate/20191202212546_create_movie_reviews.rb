class CreateMovieReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_reviews do |t|
      t.integer :movie_id
      t.integer :user_id
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
