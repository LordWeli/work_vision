class CreateVerifications < ActiveRecord::Migration[6.1]
  def change
    create_table :verifications do |t|
      t.boolean :valid, default: false
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
