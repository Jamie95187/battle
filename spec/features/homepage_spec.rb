describe 'homepage', type: :feature do

  before do
    visit '/'
  end

  it 'should check that the homepage works' do
    expect(page).to have_content("Battle Home Page")
  end

  it 'should allow user to input name into a form' do
    fill_in 'player 1', with: "Bob"
    click_button 'Submit'
    expect(page).to have_content("Bob")
  end
end
