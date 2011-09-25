class DanceController < ApplicationController
  def index
    @dances = Dance.paginate(:page => params[:page],:per_page => 10)
    if signed_in?
      @user= current_user
      @routine = Routine.paginate(:page => params[:page])
    end
  end

end
