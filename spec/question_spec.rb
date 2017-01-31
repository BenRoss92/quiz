require './app/models/question'

describe Question do

  subject(:question) { described_class.new(question_data) }
  let(:question_data) do
    {
    time_limit: 10,
    text: "Who was the legendary Benedictine monk who invented champagne?",
    correct_answer: "Dom Perignon",
    option_2: "Ansgar",
    option_3: "Willibrord"
    }
  end

  it "knows its text" do
    expect(question.text).to eq(
    "Who was the legendary Benedictine monk who invented champagne?"
    )
  end

  it "knows its time_limit" do
    expect(question.time_limit).to eq(10)
  end

  it "knows the correct answer" do
    expect(question.correct_answer).to eq("Dom Perignon")
  end

  it "knows a second option" do
    expect(question.option_2).to eq("Ansgar")
  end

  it "knows a third option" do
    expect(question.option_3).to eq("Willibrord")
  end

end
