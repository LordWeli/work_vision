class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.string :fullname
      t.string :slug_name
      t.integer :age
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :service, null: true, foreign_key: true
      t.references :hour, null: true, foreign_key: true
      t.references :content, null: true, foreign_key: true
      t.references :verification, null: true, foreign_key: true

      t.timestamps
    end
  end
end
