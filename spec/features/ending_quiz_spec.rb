feature 'ending the quiz' do
  let(:question_list) { QuestionList.instance }

  scenario 'an ending page is displayed after answering last question' do
    allow(question_list).to receive(:select_question).with(3).and_raise(
    Exceptions::NoQuestionError)
    visit('/questions/3')
    expect(page).to have_current_path('/end')
    expect(page).to have_content("That's it!")
    expect(page).to have_content("Thanks for playing!")
    expect(page).to have_link("Play again?")
  end
end
