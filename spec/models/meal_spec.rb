require 'spec_helper'

describe Meal do
  let!(:user) {create(:user)}
  let!(:meal) {Meal.new(name: "Lasagne",date: Time.zone.now, user: user, type_of_meal: :lunch)}
  it 'responds to accessors' do
    expect(meal).to respond_to(:name)
    expect(meal).to respond_to(:date)
    expect(meal).to respond_to(:user)
    expect(meal).to respond_to(:type_of_meal)
  end

  it 'is valid' do
    expect(meal).to be_valid
  end

  describe "without name" do
    before(:each) {meal.name=nil}
    it 'is not valid' do
      expect(meal).to_not be_valid
    end
  end

  describe "without date" do
    before(:each) {meal.date=nil}
    it 'is not valid' do
      expect(meal).to_not be_valid
    end
  end

  describe "without user" do
    before(:each) {meal.user=nil}
    it 'is not valid' do
      expect(meal).to_not be_valid
    end
  end

  describe '.by_user' do
    let!(:other_user) {create(:user, email:'other@example.com')}
    let!(:other_users_meal) {Meal.create(name: "other Lasagne",date: Time.current, user: other_user, type_of_meal: :lunch)}
    before do
      meal.save
    end
    it 'only returns meals by given user' do
      expect(Meal.by_user(user)).to_not include other_users_meal
      expect(Meal.by_user(user)).to include meal
    end
  end

end
