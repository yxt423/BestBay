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

    it "should have book title" do
      click_link "Books"
      page.should have_title("Books")
    end

    it "should have Phone title" do
      click_link "Phones"
      page.should have_title("Phones")
    end

    it "should have some entries" do
      click_link "Other"
      page.should have_title("Other")
    end

  end
end