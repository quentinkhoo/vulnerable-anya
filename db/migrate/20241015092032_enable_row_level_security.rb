class EnableRowLevelSecurity < ActiveRecord::Migration[7.2]
  def change
    # Define RLS policy
    reversible do |dir|
      dir.up do
        execute 'ALTER TABLE gift_cards ENABLE ROW LEVEL SECURITY'
        execute 'ALTER TABLE gift_cards FORCE ROW LEVEL SECURITY'
        execute "CREATE POLICY tenant_isolation_policy ON gift_cards USING (tenant_name_id =  current_setting('app.current_tenant_id')::UUID)"
      end
      dir.down do
        execute 'DROP POLICY tenant_isolation_policy ON gift_cards'
        execute 'ALTER TABLE gift_cards DISABLE ROW LEVEL SECURITY'
      end
    end
  end
end
