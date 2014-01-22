class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

#starts_game
Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game = Flashcards::Game.new(output)
  game.start
end

Then(/^I should see "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

#submits_guess
Given(/^the name of the card is "(.*?)"$/) do |arg1|
end

When(/^I guess "(.*?)"$/) do |arg1|
end

Then(/^the resuld should be "(.*?)"$/) do |arg1|
end


