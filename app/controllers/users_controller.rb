class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index,:show]
  
  def index
  end

  def show
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = 'ユーザーを登録しました'
        redirect_to tasks_path
      else
        flash[:danger] = '登録できませんでした'
        render :new
      end
  end

  def new
    @user = User.new
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end