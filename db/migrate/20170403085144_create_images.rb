class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :target_id
      t.string :target_type
      t.string :image

      t.timestamps
    end
  end
end
