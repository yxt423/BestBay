require 'spec_helper'

describe 'User pages' do

  #before do
  #  @user = User.new(fname: 'Example',lname: "User", email: "user@example.com", password: "111111", password_confirmation:"111111",is_seller:true)
  #end

  describe "signup page" do
    before { visit '/signup' }
    subject { page }
    it_behaves_like 'static page','/signup','Sign Up','Sign Up'

    it 'fill in' do



    fill_in "Confirm Password", with: "foobar"
    fill_in "Email",            with: "user@example.com"
    #fill_in "First Name",       with: "Example"
    #fill_in "Last Name",        with: "User"
    click_button "Create my account"
    end
    # test seller option
    #it { should have_content('sell') }
  end


end