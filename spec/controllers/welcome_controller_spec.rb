require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  
  let(:my_user) {User.create!(email: "nich@bloc.io", password: "helloworld")}

  before do
    my_user.confirm
    sign_in my_user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
