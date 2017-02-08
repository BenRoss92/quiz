feature 'viewing a welcome page' do
  scenario 'user sees welcome page on entry' do
    visit('/')
    expect(page.status_code).to be(200)
    expect(page).to have_content("Ben's Quiz")
    expect(page).to have_content('Welcome to the Quiz')
    expect(page).to have_link('Start', href: '/questions/1')
  end
end
