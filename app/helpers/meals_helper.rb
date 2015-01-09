module MealsHelper
  def meals_for_calendar(month)
    meals=[]
    ((calendar_start(@month).to_date)..(calendar_end(@month).to_date)).each do |date|
      meals << {
        date: date, breakfast: lookup_meals(date,:breakfast), lunch: lookup_meals(date,:lunch), dinner: lookup_meals(date,:dinner)
      }
    end
    meals
  end

  def calendar_start(date)
    date.at_beginning_of_month.at_beginning_of_week.to_date
  end

  def calendar_end(date)
    date.at_end_of_month.at_end_of_week.to_date
  end

  def lookup_meals(date, type)
    meals = Meal.at_date(date).with_type(type)
    meals.map {|meal| meal.name}
  end
end
