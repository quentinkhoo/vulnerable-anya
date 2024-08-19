class Tenant2::DashboardController < ApplicationController
  def index
    @users = User.all
  end
end
