class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :description
      t.string :title
      t.references :user_profile, null: true, foreign_key: true

      t.timestamps
    end
  end
end
