class Meal < ActiveRecord::Base
  attr_accessible :date, :name
  
  validates :date, presence: true
  validates :name, presence: true
end
