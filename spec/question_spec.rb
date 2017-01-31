require './app/models/question'

describe Question do

  subject(:question) { described_class.new(question_data) }
  let(:question_data) do
    {
    time_limit: 10,
    text: "Who was the legendary Benedictine monk who invented champagne?",
    correct_answer: "Dom Perignon",
    answer2: "Ansgar",
    answer3: "Willibrord"
    }
  end

  it "has question data" do
    expect(question.question_data).to eq(question_data)
  end

  it "prints question text" do
    expect(question.text).to eq(
    "Who was the legendary Benedictine monk who invented champagne?"
    )
  end



end
