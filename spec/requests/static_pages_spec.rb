require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "BestBay" }

  describe "Help page" do
    it_behaves_like 'static page','/help','BestBay','Help'
  end

  describe "About page" do
    it_behaves_like 'static page','/about','BestBay','About Us'
  end

  describe "Contact page" do
    it_behaves_like 'static page','/contact','BestBay','Contact'
  end
end