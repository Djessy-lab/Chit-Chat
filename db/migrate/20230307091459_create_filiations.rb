class CreateFiliations < ActiveRecord::Migration[7.0]
  def change
    create_table :filiations do |t|
      t.integer :progress, default: 0
      t.references :child, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
