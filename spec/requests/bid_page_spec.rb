require 'spec_helper'

describe 'Bid pages' do

    subject { page }
    before { visit '/bid',pending}
    it "should have the right title" do

      page.should have_title("Bid")
    end


    it { should have_selector('h1',    text: 'Bid') }


end