class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.integer :types, array: true, default: []

      t.timestamps
    end
  end
end
