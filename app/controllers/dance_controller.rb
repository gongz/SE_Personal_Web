class DanceController < ApplicationController
  def index
    @dances = Dance.paginate(:page => params[:page],:per_page => 10)
    @routine = Routine.paginate(:page => params[:page])
  end

end
