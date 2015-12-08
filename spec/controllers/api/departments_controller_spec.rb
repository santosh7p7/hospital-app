require 'rails_helper'

describe Api::DepartmentsController do
  before(:each) do
    Department.destroy_all
  end

  describe "GET #index" do
    it "returns a 200 response" do 
      get :index
      expect(response).to be_success
    end

    it "returns all departments" do
      departments = FactoryGirl.create_list(:department, 5)
      get :index
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(5) 
    end
  end

  describe "GET #show" do
    it "returns a 200 response" do 
      department = FactoryGirl.create(:department)
      get :show, id: department
      expect(response).to be_success
    end

    it "returns a department" do
      department = FactoryGirl.create(:department)
      get :show, id: department.id, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['id']).to eq(department.id) 
      expect(parsed_response['name']).to eq(department.name) 
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new department" do
         expect{
           post :create, department: FactoryGirl.attributes_for(:department)
         }.to change(Department, :count).by(1)
      end
    end
  end
end
