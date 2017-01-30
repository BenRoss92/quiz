class QuestionList

  attr_reader :questions

  def initialize(questions)
    @questions = questions
  end

  def select_question(n)
    n -= 1
    questions[n]
  end

end
