class Admin::UsersController < ApplicationController
  # load_and_authorize_resource
  # before_action :authenticate_user!

  layout "admin"
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "devise.registrations.signed_up"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "devise.registrations.updated"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "devise.registrations.destroyed"
    else
      flash[:warning] = t "delete_not_success"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :avatar, :email,
      :password, :password_confirmation).merge(password: "123456")
  end
end
