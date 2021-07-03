class LunchesController < ApplicationController
  def index
    @lunches = Lunch.all
  end

  def show
    @lunch = Lunch.find(params[:id])
    # @comment = Comment.new
    # @comments = @prototype.comments.includes(:user)
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

   def edit
    @lunch = Lunch.find(params[:id])
   end

   def update
    @lunch = Lunch.find(params[:id])
    if @lunch.update(lunch_params)
       redirect_to  lunch_path
    else
      render :edit
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
