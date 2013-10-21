require 'spec_helper'

describe 'Test pages' do



  describe 'should show correct items by category' do

    subject { page }
    before { visit '/home' , pending}
    it "should have the right title" do

      expect(page).to should redirect_to items_path
    end


    it { should have_selector('h1',    text: 'All Items') }


    it "should have some entries" do
      expect { click_link "All" }.to should have_title("All Items")
    end

    it "should have some entries" do
      expect { click_link "Books" }.to should have_title("Books")
    end

    it "should have some entries" do
      expect { click_link "Phones" }.to should have_title("Phones")
    end

    it "should have some entries" do
      expect { click_link "Other" }.to should have_title("Others")
    end

  end
end