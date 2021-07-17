class LunchesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: :edit

  def index
    @lunches = Lunch.all
  end

  def show
    @lunch = Lunch.find(params[:id])
    @comment = Comment.new
    @comments = @lunch.comments.includes(:user)
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
      redirect_to lunch_path
    else
      render :edit
    end
  end

  def destroy
    lunch = Lunch.find(params[:id])
    redirect_to root_path if lunch.destroy
  end

  private

  def lunch_params
    params.require(:lunch).permit(:soup, :staple_food, :main_dish, :side_dish, :drink,  :menu_date, :other, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @lunch = Lunch.find(params[:id])
    redirect_to action: :index unless current_user == @lunch.user
  end
end
