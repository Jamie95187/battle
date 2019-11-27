describe 'homepage', type: :feature do

  before do
    visit '/'
  end

  it 'should check that the homepage works' do
    expect(page).to have_content("Battle Home Page")
  end

end
