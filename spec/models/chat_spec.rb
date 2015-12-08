require 'rails_helper'

RSpec.describe Chat, type: :model do 
  it "is not valid without content" do
    chat = Chat.new(content: nil)
    expect(chat).to_not be_valid
  end 

  it "is valid with content and user" do
    chat = Chat.new(content: :test, user_id: 1)
    expect(chat).to be_valid
  end

  it "should belong to user" do
    chat = Chat.reflect_on_association(:user)
    expect(chat.macro) == :has_many
  end 

  it "should have many replies" do
    chat = Chat.reflect_on_association(:replies)
    expect(chat.macro) == :has_many
  end
end 
