class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @upcoming = @user.attended_events.upcoming
    @previous = @user.attended_events.previous
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to events_path, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
