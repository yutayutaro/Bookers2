class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  def update
    @user = User.find(params[:id])
  if@user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(params[:id])
  else
    render :edit
  end
  end
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @users = User.all
  end
  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end