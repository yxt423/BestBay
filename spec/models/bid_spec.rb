require 'spec_helper'


describe 'Bid on item' do

  before do
    @bid = Bid.new()
  end
  subject { @bid }
  describe 'when bid price is not present' do
    before do
      @bid.bid_price = ' '
    end
    it { should_not be_valid }
  end

end