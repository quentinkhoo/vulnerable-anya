class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.string :tenant

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
