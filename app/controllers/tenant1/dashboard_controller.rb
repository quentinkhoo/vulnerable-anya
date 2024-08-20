class Tenant1::DashboardController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]
  def index
    # tenant = Tenant.find_by(name: ENV.fetch("TENANT1_NAME"))
    # sql = "set app.current_tenant_id to '#{tenant.id}'"
    # result = ActiveRecord::Base.connection.execute(sql)
    @users = User.all
  end
end
