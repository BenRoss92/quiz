class QuestionList

  attr_reader :questions, :current_question

  def initialize(questions)
    @questions = questions
    @current_question = nil
  end

  def select_question(n)
    n -= 1
    @current_question = questions[n]
  end

  def next_question
    n = questions.find_index(@current_question)
    select_question(n)
  end

end
