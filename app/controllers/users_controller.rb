class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def show
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: 'Invild access'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Posted successfully.'
    else
      render :edit
    end
  end




  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :profile, :profile_image)
    end
end
