class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only:[:edit]
  def new
  end
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
