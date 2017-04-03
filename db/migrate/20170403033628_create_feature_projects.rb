class CreateFeatureProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :feature_projects do |t|
      t.references :feature, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
