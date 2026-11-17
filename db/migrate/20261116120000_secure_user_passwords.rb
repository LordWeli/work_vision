class SecureUserPasswords < ActiveRecord::Migration[8.1]
  def up
    rename_column :users, :password, :password_digest
    remove_column :users, :confirm_password
  end

  def down
    add_column :users, :confirm_password, :string
    rename_column :users, :password_digest, :password
  end
end
