class QuestionsController < ApplicationController

  def ask
  end

  def answer
    # If the message is I am going to work, the coach will answer Great!
    # If the message has a question mark ? at the end, the coach will answer Silly question, get dressed and go to work!.
    # Otherwise the coach will answer I don't care, get dressed and go to work!
    question = params[:question].strip

    if question.downcase == "i am going to work"
      @coach_reply = "Great!"
    elsif question[-1] == "?"
      @coach_reply = "Silly question, get dressed and go to work!"
    else
      params[:question] = "-no message-" if question.empty?
      @coach_reply = "I don't care, get dressed and go to work!"
    end
  end
end