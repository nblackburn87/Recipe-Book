class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :title, :string
      t.column :description, :text

      t.timestamps

    end
  end
end
