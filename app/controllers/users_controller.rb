class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information was updated successfully"
      redirect_to articles_path
    else
      rende 'edit'
    end

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Bloggers Community #{@user.username}, you have succesfully Signed up!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
