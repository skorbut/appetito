class Meal < ActiveRecord::Base
  extend Enumerize

  belongs_to :user

  validates :date, presence: true
  validates :name, presence: true
  validates :type_of_meal, presence: true
  validates :user, :presence => true


  enumerize :type_of_meal, :in => [:breakfast, :lunch, :dinner]

  def self.at_date date
    where(date: date)
  end

  def self.with_type type
    where(type_of_meal: type)
  end

  def self.by_user(user)
    where(user: user)
  end
end
