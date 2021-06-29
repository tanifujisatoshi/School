class LunchesController < ApplicationController
  def index
    
  end

  def destroy
    lunch = Pr.find(params[:id])
     if prototype.destroy
       redirect_to root_path
     end
   end

  private

   def lunch_params
    params.require(:lunch).permit(:soup, :staple_food, :main_dish, :side_dish, :drink, :other, :menu_date, :image).merge(user_id: current_user.id)
  end 

end
