class RoutinesController < ApplicationController
  def create
   @dance = Dance.find(params[:routine][:dance_id])
   current_user.add_dance!(@dance)
   respond_to do |format|
      format.html { redirect_to dance_path }
      #format.js
   end
  end


  #def destroy
  #  @routine = Routine.find(params[:id])
  #  current_user.del_dance!(@routine)
  #  redirect_to dance_path
  #end

  def show
    @user = current_user
    @routine = @user.find(params[:id])
    @routine = @routine.paginate(:page => params[:page])
  end

end
