class PagesController < ApplicationController


  def home
    @title = 'Home'
    if signed_in?
      @user= current_user
      @users = User.paginate(:page => params[:page])
    end
  end



end
