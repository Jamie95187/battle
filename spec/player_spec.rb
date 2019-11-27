require 'player'

describe Player do
  subject{Player.new("Bob")}
  it 'should have a name' do
    expect(subject).to have_attributes name: "Bob"
  end
end
