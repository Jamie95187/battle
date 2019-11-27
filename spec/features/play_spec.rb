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
end
