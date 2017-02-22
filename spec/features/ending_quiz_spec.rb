feature 'ending the quiz' do
  scenario 'an ending page is displayed after answering last question' do
    visit('/questions/3')
    expect(page).to have_current_path('/end')
    expect(page).to have_content("That's it!")
    expect(page).to have_content("Thanks for playing!")
    expect(page).to have_link("Play again?")
  end
end
