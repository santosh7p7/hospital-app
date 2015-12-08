require 'rails_helper'

RSpec.describe User, type: :model do 
  it "is not valid without name" do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end 

  it "is valid with name" do
    user = User.new(name: :test, department_id: 3)
    expect(user).to be_valid
  end

  it "should have many chats" do
    user = User.reflect_on_association(:chats)
    expect(user.macro) == :has_many
  end

  it "should belong to department" do
    user = User.reflect_on_association(:department)
    expect(user.macro) == :belongs_to
  end
end 
