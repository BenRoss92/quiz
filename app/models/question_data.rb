# Understands a list of question data

require "csv"

class QuestionData

  attr_reader :questions

  def initialize(file = './app/lib/question_list.csv')
    @questions = []
    load_questions(file)
  end

  def load_questions(file)
    CSV.foreach(file) do |row|
      time_limit, text, correct_answer, option_2, option_3 = row[0],
       row[1], row[2], row[3], row[4]
      @questions << {
        time_limit: time_limit, text: text,
        correct_answer: correct_answer, option_2: option_2, option_3: option_3
      }
    end
  end

end
