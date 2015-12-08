require 'rails_helper'

describe Api::UsersController do
  let(:department_id) {
    # FactoryGirl.create(:department)
    1
  }
  
  before(:each) do
    User.destroy_all
  end

  describe "GET #index" do
    it "returns a 200 response" do 
      get :index, department_id: department_id
      expect(response).to be_success
    end

    it "returns all users" do
      FactoryGirl.create_list(:user, 3)
      get :index, department_id: department_id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(3) 
    end
  end

  describe "GET #show" do
    it "returns a 200 response" do 
      user = FactoryGirl.create(:user)
      get :show, id: user, department_id: department_id 
      expect(response).to be_success
    end

    it "returns specific user only" do
      user = FactoryGirl.create(:user)
      get :show, id: user, department_id: department_id 
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['id']).to eq(user.id) 
    end
  end


  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, department_id: department_id, user: FactoryGirl.attributes_for(:user, department_id: department_id)
        }.to change(User, :count).by(1)
      end
    end
  end

end
