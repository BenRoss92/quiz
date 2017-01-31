require './app/models/question_list'

describe QuestionList do

  let(:question) { double(:question, question_data: current_question) }
  let(:current_question) do {
    time_limit: 10,
    text: "Who was the legendary Benedictine monk who invented champagne?",
    correct_answer: "Dom Perignon",
    answer2: "Ansgar",
    answer3: "Willibrord"
    }
  end
  let(:question_class) { double(:question_class, new: question) }
  subject(:question_list) { described_class.new(questions, question_class) }

  let(:questions) do
    [{
      time_limit: 10,
      text: "Who was the legendary Benedictine monk who invented champagne?",
      correct_answer: "Dom Perignon",
      answer2: "Ansgar",
      answer3: "Willibrord"
      },
      {
        time_limit: 12,
        text: "Name the largest freshwater lake in the world?",
        correct_answer: "Lake Superior",
        answer2: "Lake Victoria",
        answer3: "Lake Huron"
      }]
  end

  let(:question1) { questions[0] }
  let(:question2) { questions[1] }

  it "has a list of question data" do
    expect(question_list.questions).to eq(questions)
  end

  describe '#select_question' do
    it "selects a question" do
      question_list.select_question(1)
      expect(question_list.current_question).to eq(question1)
    end

    it "creates a question" do
      expect(question_class).to receive(:new).with(question_data: current_question)
      question_list.select_question(1)
    end
  end

  describe '#next_question' do
    it "selects the next question" do
      question_list.select_question(1)
      question_list.next_question
      expect(question_list.current_question).to eq(question2)
    end
  end

  it "selects the first question by default" do
    expect(question_list.current_question).to eq(question1)
  end

end
