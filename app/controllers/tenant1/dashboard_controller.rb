class Tenant1::DashboardController < ApplicationController
  def index
    @users = User.all
  end
end