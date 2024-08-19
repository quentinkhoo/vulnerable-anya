class Tenant1::DashboardController < ApplicationController
  def index
    tenant = Tenant.find_by(name: ENV.fetch("TENANT1_NAME"))
    sql = "set app.current_tenant_id to '#{tenant.id}'"
    result = ActiveRecord::Base.connection.execute(sql)
    @users = User.all
  end
end
