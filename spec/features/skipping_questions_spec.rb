feature 'triggering next question' do
  scenario 'user can trigger next question manually' do
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
