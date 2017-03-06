require './app/models/question_data'

describe QuestionData do

  subject(:question_data_instance) { described_class.new(data) }
  let(:question_data_class) { described_class }
  let(:CSV) { double(:CSV, foreach: nil) }
  let(:questions) { [] }
  let(:file) { double(:file) }
  let(:data) do
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

  describe '#questions' do
    it "has an array of question data from CSV" do
      expect(question_data_instance.questions).to eq(data)
    end
  end

  describe '.parse_csv' do
    it "parses CSV data into hash data" do
      expect(CSV).to receive(:foreach).with(file)
      question_data_class.parse_csv(file, questions)
    end
  end

  describe '.load_questions' do
    it "calls '.parse_csv' method" do
      expect(question_data_class).to receive(:parse_csv).with(file, questions)
      question_data_class.load_questions(file, questions)
    end

    it "creates an instance with CSV data" do
      allow(question_data_class).to receive(:load_questions).with(file, questions)
      allow(question_data_class).to receive(:new).with(data).and_return(question_data_instance)
      expect(question_data_class).to receive(:load_questions).with(file, questions).and_return(question_data_instance)
      question_data_class.load_questions(file, questions)
    end
  end

  describe '.new' do
    it "creates a new instance with CSV data" do
      expect(question_data_class).to receive(:new).with(data).and_return(question_data_instance)
      question_data_class.new(data)
    end
  end

end
