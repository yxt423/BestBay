require 'spec_helper'

describe 'User pages' do

  subject { page }

  describe "signup page" do
    it_behaves_like 'static page','/signup','Sign Up','Sign Up'
  end


end