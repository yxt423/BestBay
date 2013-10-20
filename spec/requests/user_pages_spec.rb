require 'spec_helper'

describe 'User pages' do

  before { visit '/signup' }
  subject { page }

  #before do
  #  @user = User.new(fname: 'Example',lname: "User", email: "user@example.com", password: "111111", password_confirmation:"111111",is_seller:true)
  #end

  describe "signup page" do
    it_behaves_like 'static page','/signup','Sign Up','Sign Up'

    # test seller option
    #it { should have_content('sell') }
  end


end