require 'spec_helper'

describe Meal do
  before {@meal=Meal.new(name: "Lasagne",date: Time.zone.now)}
  subject {@meal}
  it {should respond_to(:name)}
  it {should respond_to(:date)}
  it {should be_valid}

  describe "without name" do
    before(:each) {@meal.name=nil}
    it {should_not be_valid}
  end
  
  describe "without date" do
    before(:each) {@meal.date=nil}
    it {should_not be_valid}
  end

end
