class CreateParticipates < ActiveRecord::Migration[5.0]
  def change
    create_table :participates do |t|
      t.boolean :is_accept
      t.string :position
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
