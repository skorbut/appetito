class Meal < ActiveRecord::Base
  extend Enumerize
  attr_accessible :date, :name, :type_of_meal
  
  validates :date, presence: true
  validates :name, presence: true
  
  enumerize :type_of_meal, :in => [:breakfast, :lunch, :dinner]
  scope at_date, lambda { |date| where(:date => date.beginning_of_day..date.end_of_day)}
end
