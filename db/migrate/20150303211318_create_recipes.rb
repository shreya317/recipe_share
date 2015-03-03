class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.belongs_to :user
      t.date :date_posted
      t.text :description
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end
