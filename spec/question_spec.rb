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

  describe '#shuffle_options' do
    it "shuffles the answer options" do
      shuffled_options = ["Dom Perignon", "Ansgar", "Willibrord"]
      allow_any_instance_of(Array).to receive(:shuffle).and_return(shuffled_options)
      expect(question.shuffle_options).to eq(shuffled_options)
    end
  end

  describe '#result' do
    it "finds out if answer is incorrect" do
      answer = "Ansgar"
      expect(question.get_result(answer)).to be :incorrect
    end

    it "finds out if answer is correct" do
      answer = "Dom Perignon"
      expect(question.get_result(answer)).to be :correct
    end
  end

end
