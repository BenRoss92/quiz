# Understands iterating over a list of questions

require './app/models/question'

class QuestionList

  attr_reader :questions, :current_question, :current_number

  START_NO = 1

  def initialize(questions, question_class = Question, start_no = START_NO )
    @questions = questions
    @question_class = question_class
    @current_question = questions[start_no - 1]
    @current_number = start_no
  end

  def select_question(current_number)
    @current_number = current_number
    @current_question = @question_class.new(questions[(current_number - 1)])
  end

  def next_question
    select_question(current_number + 1)
  end

  def print_question
    current_question.text
  end

  private

  attr_reader :question_class

end
