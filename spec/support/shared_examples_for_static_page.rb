require 'spec_helper'

shared_examples_for 'static page' do |static_page_path, content, title|

  let(:base_title) { "BestBay" }
  before { visit static_page_path }
  subject { page }


  it { should have_content(content) }
  it { should have_title("#{base_title} | #{title}") }

end
