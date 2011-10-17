class UsersController < ApplicationController
   def new
    @title = "Sign up"
    @user = User.new

  end

  def show
    @user = User.find(params[:id])
    @routine = Routine.paginate(:page => params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      sign_in @user
      redirect_to dance_path
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def index
    flash.now[:error] = "Sorry you are attempting to dance on one foot..."
  end
end
