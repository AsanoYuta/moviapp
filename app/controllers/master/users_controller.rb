class Master::UsersController < ApplicationController
before_action :authenticate_master!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "編集が完了しました。"
    redirect_to master_user_path(@user.id)
    else
    @user=User.find(params[:id])
    @user.update(user_params)
    render :edit
    end
  end
  def destroy
      @user = User.find(params[:id])
      @user.destroy
    redirect_to root_path
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :password, :is_deleted)
  end
end
