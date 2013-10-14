require 'spec_helper'

shared_examples_for 'static page' do |static_page_path, content, title|

  let(:base_title) { "BestBay" }
  before { visit static_page_path }

  it "should have the content #{content}" do
      expect(page).to have_content(content)
  end

  it "should have the title #{title}" do
      expect(page).to have_title("#{base_title} | #{title}")
  end

end
