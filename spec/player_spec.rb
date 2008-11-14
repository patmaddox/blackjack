require File.dirname(__FILE__) + '/spec_helper'

describe Player, '#wager' do
  before(:each) do
    @player = Player.new(100)
  end
  
  it "should reduce the player's balance by the amount wagered" do
    @player.wager(10)
    @player.balance.should == 90
  end

  it "should raise an error if player attempts to wager more than balance" do
    lambda {
      @player.wager(101)
    }.should raise_error
  end
end

describe Player, '#pay' do
  before(:each) do
    @player = Player.new(100)
  end
  
  it "should increase the player's balance by the amount paid" do
    @player.pay(10)
    @player.balance.should == 110
  end
end
