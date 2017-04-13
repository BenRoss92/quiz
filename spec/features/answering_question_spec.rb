feature 'answering a question' do
  scenario 'when answered correctly, displays correct verdict', js: true do
    visit('/')
    click_link('Start')
    choose('Dom Perignon')
    click_button('Submit')
    expect(page).to have_content('Correct')
  end
end
