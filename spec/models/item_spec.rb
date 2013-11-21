require 'spec_helper'

describe Item do

  before do
    @user = User.new(fname: 'Example',lname: "User", email: "user@example.com", password: "111111", password_confirmation:"111111")
    @item = Item.new(user_id: @user.id, category_id: 1, name: "ipad", description: "This is an ipad!", base_price:10, quantity: 100)
  end

  subject { @item }

  it { should respond_to(:user_id) }
  it { should respond_to(:category) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:base_price) }

  it { should be_valid }

  #Name Test

  describe 'when name is not present' do
    before do
      @item.name = ' '
    end
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @item.name = "a" * 257 }
    it { should_not be_valid }
  end

  #Description Test

  describe 'when description is not present' do
    before do
      @item.name = ' '
    end
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @item.description = "a" * 1025 }
    it { should_not be_valid }
  end

  describe 'when description is not present' do
    before do
      @item.description = ' '
    end
    it { should_not be_valid }
  end

  #attributes Test

  describe 'when other attributes are not present' do
    before do

      @item.base_price = ' '
      @item.user_id = ' '
    end
    it { should_not be_valid }
  end

end
