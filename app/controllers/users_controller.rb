class UsersController < ApplicationController
  def new
  
  end

  def create
    @user = User.new(params_user)

    if @user.save
      flash[:notice] = "You have successfully signed up!"
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  protected

  def params_user
    params.require(:user).permit(:username)
  end

end