# Understands displaying details of a question

class Question

  attr_reader :question_data, :text

  def initialize(question_data)
    @question_data = question_data
    @text = question_data[:text]
  end

end
