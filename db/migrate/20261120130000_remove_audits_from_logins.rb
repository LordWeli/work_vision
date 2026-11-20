class RemoveAuditsFromLogins < ActiveRecord::Migration[8.1]
  def change
    remove_column :logins, :audits, :json, default: [], array: true
  end
end
