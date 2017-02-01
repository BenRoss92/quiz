# Understands displaying details of a question

class Question

  attr_reader :text, :time_limit, :correct_answer, :option_2, :option_3

  def initialize(question_data)
    @text           = question_data[:text]
    @time_limit     = question_data[:time_limit]
    @correct_answer = question_data[:correct_answer]
    @option_2       = question_data[:option_2]
    @option_3       = question_data[:option_3]
  end

  def shuffle_options
    [correct_answer, option_2, option_3].shuffle
  end

end
