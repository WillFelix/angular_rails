class UsersController < ApplicationController
  def index
    respond_with User.all.order(id: :desc)
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    respond_with User.create(user_params)
  end

  def update
    u = User.find(params[:id])
    respond_with u.update(user_params)
  end

  def destroy
    u = User.find(params[:id])
    respond_with u.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :gender, :birthdate)
  end
end
