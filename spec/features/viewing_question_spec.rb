require 'timecop'

feature 'viewing a question' do
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

  scenario 'a user sees only one question at a time' do
    allow(question_list).to receive(:questions).and_return(data)

    visit('/')
    click_link('Start')
    expect(page).to have_current_path('/questions/1')
    within '#timer' do
      expect(page).to have_content(10)
    end
    expect(page).to have_content(
    "1. Who was the legendary Benedictine monk who invented champagne?"
    )
    expect(page).to have_unchecked_field("Dom Perignon")
    expect(page).to have_unchecked_field("Ansgar")
    expect(page).to have_unchecked_field("Willibrord")
  end

  scenario 'time limit reduces by one after one second', js: true do
    allow(question_list).to receive(:questions).and_return(data)
    visit('/')
    click_link('Start')
    within '#timer' do
      expect(page).to have_content(10)
    end
    Timecop.travel(2) do
      within '#timer' do
        expect(page).to have_content(8)
      end
    end
  end

end
