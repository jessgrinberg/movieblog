class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image
      t.string :year
      t.text :plot

      t.timestamps null: false
    end
  end
end
