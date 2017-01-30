class QuestionList

  attr_reader :questions, :current_question, :current_number

  def initialize(questions)
    @questions = questions
    @current_question = nil
    @current_number = nil
  end

  def select_question(current_number)
    @current_number = current_number
    @current_question = questions[(current_number - 1)]
  end

  def next_question
    select_question(current_number + 1)
  end

end
