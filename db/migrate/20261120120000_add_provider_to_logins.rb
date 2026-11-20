class AddProviderToLogins < ActiveRecord::Migration[8.1]
  def change
    add_column :logins, :provider, :string
  end
end
