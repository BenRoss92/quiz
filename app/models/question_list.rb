require './app/models/question'

class QuestionList

  attr_reader :questions, :current_question, :current_number

  def initialize(questions, question_class = Question)
    @questions = questions
    @question_class = question_class
    @current_question = questions.first
    @current_number = 1
  end

  def select_question(current_number)
    @current_number = current_number
    @current_question = questions[(current_number - 1)]
    @question_class.new(question_data: current_question)
  end

  def next_question
    select_question(current_number + 1)
  end

  private

  attr_reader :question_class

end
