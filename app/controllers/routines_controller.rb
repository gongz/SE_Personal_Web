class RoutinesController < ApplicationController
  def create
   @dance = Dance.find(params[:routine][:dance_id])
   if signed_in?
      @user= current_user
      @routine = Routine.paginate(:page => params[:page])
  end
   current_user.add_dance!(@dance)
   respond_to do |format|
      format.html { redirect_to dance_path }
      format.js
   end
  end


  #def destroy
  #  @routine = Routine.find(params[:id])
  #  current_user.del_dance!(@routine)
  #  redirect_to dance_path
  #end
end
