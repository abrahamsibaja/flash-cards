system('clear')
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
  display = Flashcards::Console_display.new(output)
  display.game_intro
end

Then(/^I should see "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

#submits_guess
Given(/^the name of the card is "(.*?)"$/) do |name|
  @display = Flashcards::Console_display.new(output)
  @display.game.deck.take_a_card(name)
end

When(/^I guess "(.*?)"$/) do |guess|
  @display.game.check_guess(guess)
  @display.show_guess_result
end

Then(/^the result should be "(.*?)"$/) do |result|
  output.messages.should include(result)
end
