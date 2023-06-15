class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :email
      t.string :whatsapp
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
