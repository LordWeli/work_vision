class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.string :slug_name
      t.integer :age
      t.string :description
      t.string :document
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
