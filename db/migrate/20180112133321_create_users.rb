class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :name
      t.string :digest_password

      t.timestamps
    end
  end
end
