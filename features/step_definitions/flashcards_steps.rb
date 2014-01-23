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
  game = Flashcards::Game.new(output)
  game.game_intro
end

Then(/^I should see "([^"]*)"$/) do |message|
  output.messages.should include(message)
end

#submits_guess
Given(/^the name of the card is "(.*?)"$/) do |name|
  @game = Flashcards::Game.new(output)
  @game.deck.take_a_random_card until deck.card[:english] == name
end

When(/^I guess "(.*?)"$/) do |guess|
  @game.check_answer(guess)
  @game.show_result
end

Then(/^the result should be "(.*?)"$/) do |result|
  output.messages.should include(result)
end
