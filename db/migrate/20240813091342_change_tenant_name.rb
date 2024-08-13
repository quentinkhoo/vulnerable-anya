class ChangeTenantName < ActiveRecord::Migration[7.2]
  def change
    rename_column :users, :tenant, :tenant_name
    rename_column :tenants, :name, :tenant_name
  end
end
