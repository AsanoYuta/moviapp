class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :ensure_correct_user, only:[:edit]
  def new
  end
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
    redirect_to user_path(@user.id)
    else
    @user=User.find(params[:id])
    @user.update(user_params)
    render :edit
    end
  end
  def confirm
  end
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :password)
  end
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
end
