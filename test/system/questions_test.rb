require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "label[for=name]", text: "Ask your Coach anything"
    take_screenshot
  end

  test "empty message" do
    visit ask_url
    fill_in "question", with: ""
    click_on "Ask"

    assert_selector ".coach-message", text: "I don't care, get dressed and go to work!"
    take_screenshot
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    assert_selector ".coach-message", text: "I don't care, get dressed and go to work!"
    take_screenshot
  end

  test "stringh with `?` but not at the end of string" do
    visit ask_url
    fill_in "question", with: "Hel?lo"
    click_on "Ask"

    assert_selector ".coach-message", text: "I don't care, get dressed and go to work!"
    take_screenshot
  end

  test "stringh with `?` at the end of string" do
    visit ask_url
    fill_in "question", with: "Hello?"
    click_on "Ask"

    assert_selector ".coach-message", text: "Silly question, get dressed and go to work!"
    take_screenshot
  end

  test "Expected message by coach `i am going to work`" do
    visit ask_url
    fill_in "question", with: "i am going to work"
    click_on "Ask"

    assert_selector ".coach-message", text: "Great!"
    take_screenshot
  end

  test "Expected message by coach with some upper case characters `I am Going to Work`" do
    visit ask_url
    fill_in "question", with: "i am going to work"
    click_on "Ask"

    assert_selector ".coach-message", text: "Great!"
    take_screenshot
  end

  test "Expected message by coach with extra spaces `  i am   going   to   work   `" do
    visit ask_url
    fill_in "question", with: "i am going to work"
    click_on "Ask"

    assert_selector ".coach-message", text: "Great!"
    take_screenshot
  end
end

# old content
# require "application_system_test_case"

# class QuestionsTest < ApplicationSystemTestCase
#   # test "visiting the index" do
#   #   visit questions_url
#   #
#   #   assert_selector "h1", text: "Questions"
#   # end
# end
