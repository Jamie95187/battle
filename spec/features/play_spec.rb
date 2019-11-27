describe 'play page', type: :feature do

  before do
    visit '/'
    fill_in 'player 1', with: "Bob"
    fill_in 'player 2', with: "Mandy"
    click_button 'Submit'
  end

  it 'should display the players names' do
    expect(page).to have_content("Bob vs. Mandy")
  end

  it "should display players 2's health" do
    expect(page).to have_content("player 2: 100 hp")
  end
end
