class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.text :description
      t.boolean :is_suggest
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
