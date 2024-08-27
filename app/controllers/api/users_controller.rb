class Api::UsersController < ApplicationController
  def index
    @users = User.select(:id, :name, :email).all
    render json: @users, status: :ok
  end

  def show
    begin
      @user = User.select(:id, :name, :email).find(params[:id])
      render json: @user, status: :ok
    rescue
      render json: { error: "User not found" }, status: :not_found
    end
  end

end
