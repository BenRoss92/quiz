require './app/models/question_list'

describe QuestionList do

  subject(:question_list) { described_class.new(questions) }

  let(:question1) { questions[0] }
  let(:question2) { questions[1] }

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

  it "has a list of questions and their data" do
    expect(question_list.questions).to eq(questions)
  end

  it "selects a question" do
    expect(question_list.select_question(1)).to eq(question1)
  end

  it "selects the next question" do
    question_list.select_question(1)
    question_list.next_question
    expect(question_list.current_question).to eq(question2)
  end

  it "selects first question in list by default" do
    expect(question_list.current_question).to eq(question1)
  end

end
