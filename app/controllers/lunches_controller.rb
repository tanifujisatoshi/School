class LunchesController < ApplicationController
  def index
    @lunches = Lunch.all
  end

  def show
    
  end

  def new
    @lunch = Lunch.new 
  end

  def create
    @lunch = Lunch.new(lunch_params)
    if @lunch.save
        redirect_to root_path
    else  
     render :new
    end
   end

  def destroy
    lunch = Lunch.find(params[:id])
     if lunch.destroy
       redirect_to root_path
     end
   end

  private

   def lunch_params
    params.require(:lunch).permit(:soup, :staple_food, :main_dish, :side_dish, :drink, :other, :menu_date, :image).merge(user_id: current_user.id)
  end 

end
