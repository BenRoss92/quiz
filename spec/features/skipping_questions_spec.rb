feature 'triggering next question' do
  let(:question_list) { QuestionList.instance }
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

  scenario 'user can trigger next question manually' do
    allow(question_list).to receive(:questions).and_return(data)
    
    visit('/')
    click_link('Start')
    expect(page).to have_current_path('/questions/1')
    click_button('Next Question')
    expect(page).to have_current_path('/questions/2')
    expect(page).to have_content(
    "Name the largest freshwater lake in the world?"
    )
  end
end
