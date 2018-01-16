class AddAdimnStatusForUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin_status, :boolean, null: false, default: false
  end
end
