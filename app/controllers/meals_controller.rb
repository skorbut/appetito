class MealsController < ApplicationController
  def new
    @meal=Meal.new
  end

  def create
    @meal=Meal.new(params[:meal])
    if @meal.valid?
      @meal.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    #@meal=Meal.find(params[:id])
    @meal=Meal.all.first
  end

  def index
    @meals=Meal.all
  end

  def calendar
    @month=Time.zone.now
    if (params[:month])
      @month=Date.parse(params[:month])
    end
    @days=Meal.for_month(@month)
    @meals=Meal.all
  end
end
