class CreateHours < ActiveRecord::Migration[6.1]
  def change
    create_table :hours do |t|
      t.time :init
      t.time :final
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
