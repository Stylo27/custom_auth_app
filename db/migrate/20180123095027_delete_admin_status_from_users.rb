class DeleteAdminStatusFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admin_status
  end
end
