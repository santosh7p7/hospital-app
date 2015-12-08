require 'rails_helper'

RSpec.describe Department, type: :model do 
  it "is not valid without name" do
    dept = Department.new(name: nil)
    expect(dept).to_not be_valid
  end 

  it "is valid with name" do
    dept = Department.new(name: :test)
    expect(dept).to be_valid
  end

  it "should be unique" do
    Department.create!(name: :test)
    dept = Department.new(name: :test)
    expect(dept).to_not be_valid
    expect(dept.errors[:name]).to include("has already been taken")
  end 

  it "should have many users" do
    dept = Department.reflect_on_association(:users)
    expect(dept.macro) == :has_many
  end
end 
