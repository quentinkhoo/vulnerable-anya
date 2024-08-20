class Tenant1::DashboardController < Tenant1Controller
  skip_before_action :authenticate_request, only: [:index]

  def index
    @users = User.all
  end
end
