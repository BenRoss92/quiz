class QuestionList

  attr_reader :questions, :current_question

  def initialize(questions)
    @questions = questions
    @current_question = nil
  end

  def select_question(n)
    @current_question = questions[n - 1]
  end

  def next_question
    n = questions.find_index(current_question)
    select_question(n+2)
  end

end
