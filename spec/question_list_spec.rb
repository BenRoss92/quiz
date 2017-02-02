require './app/models/question_list'

describe QuestionList do

  let(:question) { double(:question, question_info) }
  let(:question_info) do {
    time_limit: 10,
    text: "Who was the legendary Benedictine monk who invented champagne?",
    correct_answer: "Dom Perignon",
    option_2: "Ansgar",
    option_3: "Willibrord"
    }
  end
  let(:question_class) { double(:question_class, new: question) }
  subject(:question_list) { described_class.new(question_data, question_class) }
  let(:question_data) { instance_double("question_data", questions: questions)}

  let(:questions) do
    [{
      time_limit: 10,
      text: "Who was the legendary Benedictine monk who invented champagne?",
      correct_answer: "Dom Perignon",
      option_2: "Ansgar",
      option_3: "Willibrord"
      },
      {
        time_limit: 12,
        text: "Name the largest freshwater lake in the world?",
        correct_answer: "Lake Superior",
        option_2: "Lake Victoria",
        option_3: "Lake Huron"
      }]
  end

  let(:question1) { questions[0] }
  let(:question2) { questions[1] }

  it "has a list of question data" do
    expect(question_list.questions).to eq(question_info)
  end

  it "selects the first question by default" do
    expect(question_list.current_question).to eq(question1)
  end

  describe '#select_question' do
    it "creates a question" do
      expect(question_class).to receive(:new).with(question_info)
      question_list.select_question(1)
    end

    xit "selects a question" do
      question_list.select_question(1)
      expect(question_list.current_question).to eq(question1)
    end
  end

  describe '#print_options' do
    it "prints options for current question" do
      shuffled_options = ["Dom Perignon", "Ansgar", "Willibrord"]
      allow(question).to receive(:shuffle_options) { shuffled_options }
      question_list.select_question(1)
      expect(question_list.print_options).to eq(shuffled_options)
    end
  end

  context 'after selecting a question' do
    before(:each) do
      question_list.select_question(1)
    end

    describe '#next_question' do
      xit "selects the next question" do
        question_list.next_question
        expect(question_list.current_question).to eq(question2)
      end
    end

    describe '#print_question' do
      it "prints the current question" do
        expect(question_list.print_question).to eq(
        "Who was the legendary Benedictine monk who invented champagne?"
        )
      end
    end
  end

end
