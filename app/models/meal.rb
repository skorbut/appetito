class Meal < ActiveRecord::Base
  extend Enumerize

  validates :date, presence: true
  validates :name, presence: true

  enumerize :type_of_meal, :in => [:breakfast, :lunch, :dinner]

  def self.at_date date
    where(date: date.beginning_of_day..date.end_of_day)
  end
end
