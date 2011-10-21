class RoutinesController < ApplicationController
  def create
   @dance = Dance.find(params[:routine][:dance_id])
   if signed_in?
      @user= current_user
      @routine = Routine.paginate(:page => params[:page])
   end
   dance_num = @user.dance.count
    if dance_num >0
      @last_routine = current_user.routine.find_by_routine_number(dance_num)
      @last_dance = Dance.find_by_id(@last_routine.dance_id)
      if @last_dance.laststep != @dance.laststep
        current_user.add_dance!(@dance,dance_num+1)
        respond_to do |format|
          format.html { redirect_to dance_path }
          format.js
        end
      else
        respond_to do |format|
          format.js { render :js => "window.location.replace('users');" }
        end
      end
    else
      current_user.add_dance!(@dance,dance_num+1)
        respond_to do |format|
          format.html { redirect_to dance_path }
          format.js
        end
    end
  end




  def destroy
    @routine = Routine.find(params[:id])
    number= @routine.routine_number
    @routine.destroy
    @routine = current_user.routine.all
    for i in @routine
        if i.routine_number > number
          i.routine_number -=1
        end
          i.update_attributes(params[:routine_number])
    end
    redirect_to current_user
  end
end
