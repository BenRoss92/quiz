feature 'viewing a question' do
  scenario 'a user sees only one question at a time' do
    visit("/questions/1")
    expect(page).to have_content(
    "1. Who was the legendary Benedictine monk who invented champagne?"
    )
    expect(page).to have_button("Dom Perignon")
    expect(page).to have_button("Ansgar")
    expect(page).to have_button("Willibrord")
  end
end
