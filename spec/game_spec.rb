require 'game'

describe Game do
  let(:player1) { double :player1 }
  let(:player2) { double :player2 }

  subject{ Game.new(player1, player2) }

  it 'should have a player 1' do
    expect(subject).to have_attributes player1: player1
  end

  it 'should have a player 2' do
    expect(subject).to have_attributes player2: player2
  end

  describe '#attack' do
    it 'should call reduce_health to player 2' do
      expect(player2).to receive(:reduce_health).with 10
      subject.attack
    end
  end

end
