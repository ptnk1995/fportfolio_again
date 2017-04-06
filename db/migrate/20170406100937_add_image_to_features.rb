class AddImageToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :image, :string
  end
end
