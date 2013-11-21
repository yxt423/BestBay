require 'spec_helper'

describe 'Test pages' do



  describe 'should show correct items by category' do

    subject { page }
    before { visit '/home'}
    it "should have the right title" do

      page.should have_title("All Items")
    end



    it "should have All Items title" do
      click_link "All"

      page.should have_title("All Items")
    end

  end
end