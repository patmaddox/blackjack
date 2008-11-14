Before do
  @game = Game.new
end

Given /^I have \$(\d+)$/ do |amount|
  @player = Player.new(amount.to_i)
end

Given /^I bet \$(\d+)$/ do |amount|
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
  @dealer_cards ||= [2] * @player_cards.size
  @game.deck = @player_cards.zip(@dealer_cards).flatten
  @game.deal
  @game.finish
end

Then /^I should have \$(\d+)$/ do |amount|
  @player.balance.should == amount.to_i
end
