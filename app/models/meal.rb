class Meal < ActiveRecord::Base
  extend Enumerize

  validates :date, presence: true
  validates :name, presence: true

  enumerize :type_of_meal, :in => [:breakfast, :lunch, :dinner]

  def self.at_date date
    where(date: date)
  end

  def self.with_type type
    where(type_of_meal: type)
  end
end
