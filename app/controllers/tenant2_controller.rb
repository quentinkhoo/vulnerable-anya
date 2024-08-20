class Tenant2Controller < ApplicationController
  before_action :set_current_tenant

  def set_current_tenant
    tenant = Tenant.find_by(name: ENV.fetch("TENANT2_NAME"))
    sql = "set app.current_tenant_id to '#{tenant.id}'"
    result = ActiveRecord::Base.connection.execute(sql)
  end
end
