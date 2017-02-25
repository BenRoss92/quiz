# Understands a list of question data

require "csv"

class QuestionData

  attr_reader :questions

  def initialize(questions)
    @questions = questions
  end

  def self.load_questions(file = './app/lib/question_list.csv')
    questions = []
    CSV.foreach(file) do |row|
      time_limit, text, correct_answer, option_2, option_3 = row[0],
       row[1], row[2], row[3], row[4]
      questions << { time_limit: time_limit, text: text,
        correct_answer: correct_answer, option_2: option_2, option_3: option_3
      }
    end
    self.new(questions)
  end

end
