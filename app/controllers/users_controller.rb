class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to todo_lists_path(current_user.id)
      # redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to todo_list_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
