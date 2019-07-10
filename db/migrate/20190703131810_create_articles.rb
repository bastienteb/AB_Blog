class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :chapeau
      t.string :text
      t.date :creation_date
      t.string :image
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
