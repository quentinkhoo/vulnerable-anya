class UpdatePrimaryKeyTenants < ActiveRecord::Migration[7.2]
  def change

    # Remove Column from users
    remove_column :users, :tenant_id

    execute "ALTER TABLE tenants DROP CONSTRAINT tenants_pkey;"
    
    # Add a unique index to the name column
    add_index :tenants, :name, unique: true
    
    # Change the name column to be the primary key
    execute "ALTER TABLE tenants ADD PRIMARY KEY (name);"

  end
end
