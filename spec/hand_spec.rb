require File.dirname(__FILE__) + '/spec_helper'

describe Hand, "score" do
  before(:each) do
    @hand = Hand.new
  end
  
  it "should be 7 when dealt 4 and 3" do
    @hand.deal 7
    @hand.deal 3
    @hand.score.should == 10
  end

  it "should be 13 when dealt 8 and 5" do
    @hand.deal 8
    @hand.deal 5
    @hand.score.should == 13
  end

  it "should be 17 when dealt 7 and K" do
    @hand.deal 7
    @hand.deal :king
    @hand.score.should == 17
  end

  it "should be 18 when dealt A and 7" do
    @hand.deal :ace
    @hand.deal 7
    @hand.score.should == 18
  end

  it "should be blackjack when dealt A and K" do
    @hand.deal :ace
    @hand.deal :king
    @hand.should be_blackjack
  end

  it "should not be blackjack when dealt A, 7 & 3" do
    @hand.deal :ace
    @hand.deal 7
    @hand.deal 3
    @hand.should_not be_blackjack
  end

  it "should be bonus when dealt 7, 7, and 7" do
    3.times { @hand.deal 7 }
    @hand.should be_bonus
  end

  it "should not be bonus when dealt 5, 7, 9" do
    @hand.deal 5
    @hand.deal 7
    @hand.deal 9
    @hand.should_not be_bonus
  end

  it "should be bonus when dealt 6, 7, 8" do
    @hand.deal 6
    @hand.deal 7
    @hand.deal 8
    @hand.should be_bonus
  end

  it "should be 12 when dealt A, A" do
    2.times { @hand.deal :ace }
    @hand.score.should == 12
  end

  it "should be 12 when dealt A, A, J" do
    2.times { @hand.deal :ace }
    @hand.deal :jack
    @hand.score.should == 12
  end
end

describe Hand, "wager" do
  it "should return the value it was created with" do
    Hand.new(10).wager.should == 10
  end
end
