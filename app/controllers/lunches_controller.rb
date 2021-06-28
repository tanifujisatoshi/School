class LunchesController < ApplicationController
  def index
    
  end

  def destroy
    lunch = Pr.find(params[:id])
     if prototype.destroy
       redirect_to root_path
     end
   end

end
