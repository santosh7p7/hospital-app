require 'rails_helper'

describe Api::ChatsController do
  let(:user_id) {
    1
  }

  let(:department_id) {
    1
  }

  before(:each) {
    Chat.destroy_all
  }

  describe "GET #index" do
    it "returns a 200 response" do 
      get :index, department_id: department_id, user_id: user_id
      expect(response).to be_success
    end

    it "returns all chats for that user" do
      chats = FactoryGirl.create(:user)
      get :index, department_id: department_id, user_id: user_id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(12) 
    end
  end

  describe "GET #show" do
    it "returns a 200 response" do 
      chat = FactoryGirl.create(:chat)
      get :show, department_id: department_id, user_id: user_id, id: chat.id
      expect(response).to be_success
    end

    it "returns a chat" do
      chat = FactoryGirl.create(:chat)
      get :show, department_id: department_id, user_id: user_id, id: chat.id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['id']).to eq(chat.id) 
      expect(parsed_response['content']).to eq(chat.content) 
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new chat" do
         expect{
           post :create, department_id: department_id, user_id: user_id, chat: FactoryGirl.attributes_for(:chat, user_id: user_id)
         }.to change(Chat, :count).by(1)
      end
    end
  end


end
