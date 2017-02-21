feature 'viewing a question' do
  scenario 'a user sees only one question at a time' do
    visit('/')
    click_link('Start')
    expect(page).to have_current_path('/questions/1')
    expect(page).to have_content(
    "1. Who was the legendary Benedictine monk who invented champagne?"
    )
    expect(page).to have_unchecked_field("Dom Perignon")
    expect(page).to have_unchecked_field("Ansgar")
    expect(page).to have_unchecked_field("Willibrord")
  end
end
