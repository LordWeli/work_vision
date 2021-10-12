class CreateLogins < ActiveRecord::Migration[6.1]
  def change
    create_table :logins do |t|
      t.references :user, null: false, foreign_key: true
      t.json :audits, array: true, default: []
      t.boolean :logged, default: false

      t.timestamps
    end
  end
end
