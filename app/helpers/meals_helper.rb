module MealsHelper
  def meals_for_calendar(month)
    meals={}
    first_day=calendar_start(month)
    last_day=calendar_end(month)
    ((calendar_start(@month).to_date)..(calendar_end(@month).to_date)).each do |date|
      meals[date]=lookup_meals(date)
    end
  end
  
  def calendar_start(date)
    date.at_beginning_of_month.at_beginning_of_week.to_date
  end
  
  def calendar_end(date)
    date.at_end_of_month.at_end_of_week.to_date
  end
  
  def lookup_meals(date)
    Meal.at_date(date)
  end
end
