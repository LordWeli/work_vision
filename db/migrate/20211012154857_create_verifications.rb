class CreateVerifications < ActiveRecord::Migration[6.1]
  def change
    create_table :verifications do |t|
      t.boolean :valid, default: false

      t.timestamps
    end
  end
end
