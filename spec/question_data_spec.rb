require './app/models/question_data'

describe QuestionData do

  subject(:question_data_instance) { described_class.new(data) }
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

  it "initializes with an array of questions" do
    expect(question_data_instance.questions).to eq(data)
  end

end
