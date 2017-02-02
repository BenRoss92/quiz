feature 'viewing a question' do

  let!(:question_list) { QuestionList.new }
  let(:question) { question_list.select_question(1) }
  let(:number) { question_list.current_number }

  xscenario 'a user sees only one question at a time' do
    visit("/questions/#{number}")
    expect(page).to have_content(
    "1. Who was the legendary Benedictine monk who invented champagne?"
    )
    within 'ul#options' do
      expect(page).to have_content("Dom Perignon")
      expect(page).to have_content("Ansgar")
      expect(page).to have_content("Willibrord")
    end
  end
end
