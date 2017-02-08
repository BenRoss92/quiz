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
  let(:valid_answer) { "Dom Perignon" }
  let(:invalid_answer) { "Ansgar" }
  let(:shuffled_options) { ["Dom Perignon", "Ansgar", "Willibrord"] }

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
      allow_any_instance_of(Array).to receive(:shuffle).and_return(shuffled_options)
      expect(question.shuffle_options).to eq(shuffled_options)
    end
  end

  describe '#get_result' do
    context 'when answer is incorect' do
      it "returns the incorrect verdict and the correct answer" do
        expect(question.get_result(invalid_answer)).to include(
        verdict: :incorrect, correct: valid_answer)
      end
    end

    context 'when answer is correct' do
      it "shows the verdict to be correct" do
        expect(question.get_result(valid_answer)).to include(verdict: :correct)
      end
    end
  end

end
