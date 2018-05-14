require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      user = User.new(first_name: "Lala", last_name: "Lolo", email: "lala@lala.fr", password: "lalala", password_confirmation: "lalala")
      user.save
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
