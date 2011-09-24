class PagesController < ApplicationController


  def home
    @title = 'Home'
    @user= current_user
    @users = User.paginate(:page => params[:page])
  end



end
