class DanceController < ApplicationController
  def index
     @dances = Dance.all
  end

end
