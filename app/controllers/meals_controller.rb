class MealsController < ApplicationController

  before_action :authenticate_user!
  
  def new
    @meal=Meal.new
  end

  def create
    @meal=Meal.new(meal_params)
    if @meal.valid?
      @meal.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @meal=Meal.find(params[:id])
  end

  def index
    @meals=Meal.all
  end

  def calendar
    @month=month
  end

  private

  def month
    @month||=month_from_param || Time.zone.now
  end

  def month_from_param
    if (params[:month])
      @month=Date.parse(params[:month])
    end
  end

  def meal_params
    params.require(:meal).permit(:name, :date, :type_of_meal)
  end
end
