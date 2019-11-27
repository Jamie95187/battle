require 'player'

describe Player do
  subject{Player.new("Bob")}
  it 'should have a name' do
    expect(subject).to have_attributes name: "Bob"
  end
  it 'should have health attribute' do
    expect(subject).to have_attributes hp: 100
  end

  describe '#reduce_health' do
    it 'should decrease health' do
      expect{subject.reduce_health(10)}.to change{subject.hp}.by -10
    end
  end
end
