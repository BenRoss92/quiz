require './app/models/question_data'

describe QuestionData do

  subject(:question_data) { described_class.new }
  let(:question_list) { double(:question_list, new: questions) }
  let(:questions) { double(:questions) }

  it "has a hardcoded array of question_data" do
    expect(question_data.questions).to eq(
    [
      {
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
      }
    ])
  end

  xit "creates a new question list" do
    allow(question_list).to receive(:new)
    question_data.set_questions
    expect(question_list).to receive(:new).with(questions)
  end

end
