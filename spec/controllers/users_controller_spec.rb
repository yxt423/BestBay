require 'spec_helper'

describe UsersController do
  describe "GET #new", newuser: true do
    it "Creates a new user" do
      get :new, format: "html"
    end

    it "Redirects to new user page" do
      expect(response.status).to eq(200)
    end
  end
end
