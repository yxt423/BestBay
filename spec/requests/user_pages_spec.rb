require 'spec_helper'

describe 'User pages' do

  subject { page }

  #describe "profile page" do
  #  pending
  #  let(:user) { FactoryGirl.create(:user) }
  #  before { visit user_path(user) }
  #
  #  it { should have_content(user.name) }
  #  it { should have_title(user.name) }
  #end

  describe "signup" do
    before { visit '/signup' }
    let(:submit) { "Create my account" }

    it_behaves_like 'static page','/signup','Sign Up','Sign Up'

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "user_fname",                 with: "Example"
        fill_in "user_lname",                 with: "User"
        fill_in "user_email",                 with: "user@example.com"
        fill_in "user_password",              with: "foobar"
        fill_in "user_password_confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end


end