describe 'play page', type: :feature do

  before do
    sign_in_and_play('Bob', 'Mandy')
  end

  it 'should display the players names' do
    expect(page).to have_content("Bob vs. Mandy")
  end

  it 'should display player 1s turn' do
    expect(page).to have_content("turn: Bob")
  end

  it "should display players 1's health" do
    expect(page).to have_content("Bob: 100/100 hp")
  end

  it "should display players 2's health" do
    expect(page).to have_content("Mandy: 100/100 hp")
  end

  context 'Having attacked' do
    before do
      click_button 'Attack'
    end

    it "should change turn to player two" do
      expect(page).to have_content "turn: Mandy"
    end

    it "should allow player 1 to attack player 2" do
      expect(page).to have_content("Successful attack!")
    end

    it "should remove message on refresh" do
      visit '/play'
      expect(page).to_not have_content("Successful attack!")
    end

    it 'should decrease player 2 health' do
      expect(page).to have_content("Mandy: 90/100 hp")
    end

    context 'Having attacked again' do
      before do
        click_button 'Attack'
      end

      it 'should decrease player one health' do
        expect(page).to have_content("Bob: 90/100 hp")
      end
    end
  end
end
