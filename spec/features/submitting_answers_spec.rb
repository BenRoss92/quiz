feature 'submitting an answer' do
  scenario 'when submission is correct, displays correct verdict', js: true do
    visit('/')
    click_link('Start')
    choose('Dom Perignon')
    click_button('Submit')
    expect(page).to have_content('Correct')
  end

  scenario 'when submission is incorrect, displays incorrect verdict', js: true do
    visit('/')
    click_link('Start')
    choose('Ansgar')
    click_button('Submit')
    expect(page).to have_content('Incorrect')
  end
end
