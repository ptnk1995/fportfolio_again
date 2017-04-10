class CreateTechniqueProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :technique_projects do |t|
      t.references :technique, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
