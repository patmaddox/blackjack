require File.dirname(__FILE__) + '/spec_helper'

describe Game, "adding a player" do
  before(:each) do
    @game = Game.new
    @player = mock('player', :null_object => true)
  end

  it "should make the player wager the amount" do
    @player.should_receive(:wager).with(10)
    @game.add_player @player, 10
  end
end

describe Game, "setting the deck" do
  before(:each) do
    @game = Game.new
    @player = mock('player', :null_object => true)
    @game.add_player @player, 10
  end

  it "should deal every other card to the player" do
    @game.deck = [10, 2, 5, 2]
    @game.deal
    @game.score_for_player(@player).should == 15
  end
end

describe Game, 'when finished' do
  before(:each) do
    @game = Game.new
    @player = mock('player', :null_object => true)
    @game.add_player @player, 10
  end

  it "should pay a winning player" do
    @game.deck = [:king, 2, :king, 2]
    @game.deal

    @player.should_receive(:pay).with(20)
    @game.finish
  end

  it "should not pay a losing player" do
    @game.deck = [2, :king, 2, :king]
    @game.deal

    @player.should_not_receive(:pay)
    @game.finish
  end

  it "should pay 2.5-1 to a player with blackjack" do
    @game.deck = [:ace, 2, :king, 2]
    @game.deal

    @player.should_receive(:pay).with(25)
    @game.finish
  end
end
