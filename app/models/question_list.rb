# Understands iterating over a list of questions

require_relative 'question'
require_relative 'question_data'
require './app/lib/exceptions'

class QuestionList
  include Exceptions

  attr_reader :current_question, :current_number

  def initialize(question_data = QuestionData.new, question_class = Question)
    @question_data = question_data
    @question_class = question_class
    @current_question = nil
    @current_number = nil
  end

  def self.instance
    @question_list ||= QuestionList.new
  end

  def questions
    question_data.questions
  end

  def select_question(current_number)
    fail NoQuestionError, "There is no question #{current_number}" if current_number > questions.length
    @current_number = current_number
    @current_question = @question_class.new(questions[(current_number - 1)])
  end

  def next_question
    select_question(current_number + 1)
  end

  def print_question
    current_question.text
  end

  def print_options
    current_question.shuffle_options
  end

  private

  attr_reader :question_class, :question_data

end
