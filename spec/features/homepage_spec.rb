describe 'homepage', type: :feature do
  it 'should check that the homepage works' do
    visit '/'
    expect(page).to have_content("Testing infrastructure working!")
  end
end
