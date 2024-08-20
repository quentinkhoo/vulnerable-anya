class Tenant2::DashboardController < Tenant2Controller
  skip_before_action :authenticate_request, only: [ :index ]

  def index
    @users = User.all
  end
end
