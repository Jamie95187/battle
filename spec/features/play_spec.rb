describe 'play page', type: :feature do

  before do
    sign_in_and_play('Bob', 'Mandy')
  end

  it 'should display the players names' do
    expect(page).to have_content("Bob vs. Mandy")
  end

  it "should display players 2's health" do
    expect(page).to have_content("player 2: 100 hp")
  end

  it "should allow player 1 to attack player 2" do
    click_button 'Attack'
    expect(page).to have_content("Successful attack!")
  end

  it "should remove message on refresh" do
    click_button 'Attack'
    visit '/play'
    expect(page).to_not have_content("Successful attack!")
  end
end
