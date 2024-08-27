class Api::UsersController < ApplicationController
  def index
    @users = User.select(:id, :name, :email).all
    puts @users.inspect
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

end
