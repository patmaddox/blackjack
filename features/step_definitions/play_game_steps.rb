Before do
  @game = Game.new
end

Given /^I have \$(\d+)$/ do |amount|
  @player = Player.new(amount.to_i)
end

Given /^I bet \$(\d+)$/ do |amount|
  raise "Implement the 'adding a player' example in spec/game_spec.rb, and '#wager' spec/player_spec.rb before proceeding"
  @game.add_player(@player, amount.to_i)
end

Given /^I am dealt (a|an) (\S+)$/ do |ignore_article, card|
  @player_cards ||= []
  @player_cards << (card.to_i > 0 ? card.to_i : card.to_sym)
end

Given /^the dealer is dealt (a|an) (\S+)$/ do |ignore_article, card|
  @dealer_cards ||= []
  @dealer_cards << (card.to_i > 0 ? card.to_i : card.to_sym)
end

When /^the dealer looks at the hands$/ do
  raise "Implement the 'setting the deck' and 'when finished' examples in spec/game_spec.rb, and '#pay' in spec/player_spec.rb"
  @dealer_cards ||= [2] * @player_cards.size
  @game.deck = @player_cards.zip(@dealer_cards).flatten
  @game.deal
  @game.finish
end

Then /^I should have \$(\d+)$/ do |amount|
  @player.balance.should == amount.to_i
end
