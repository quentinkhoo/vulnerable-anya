class DeleteColumnId < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :id
    remove_column :tenants, :id

    # Change the email column to be the primary key
    execute "ALTER TABLE users ADD PRIMARY KEY (email);"
  end
end
