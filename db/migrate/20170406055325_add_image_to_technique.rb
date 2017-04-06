class AddImageToTechnique < ActiveRecord::Migration[5.0]
  def change
    add_column :techniques, :image, :string
  end
end
