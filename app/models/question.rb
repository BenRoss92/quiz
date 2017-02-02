# Understands displaying details of a question

class Question

  attr_reader :text, :time_limit, :correct_answer, :option_2, :option_3

  def initialize(question_info)
    @text           = question_info[:text]
    @time_limit     = question_info[:time_limit]
    @correct_answer = question_info[:correct_answer]
    @option_2       = question_info[:option_2]
    @option_3       = question_info[:option_3]
  end

  def shuffle_options
    [correct_answer, option_2, option_3].shuffle
  end

end
