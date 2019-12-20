require 'oystercard'

describe Oystercard do

  describe '#initialize' do
    it 'initializes with a default balance' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'tops up with the top up value as the argument' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if the action would take the card beyond the limit' do
      expect{ subject.top_up 100 }.to raise_error "Error: Maximum limit of #{Oystercard::MAX_LIMIT} reached"
    end
  end

  describe '#touch_out' do
    let(:old_street) { "Old Street" }
    let(:kings_cross) {"Kings Cross"}
    
    before(:each) do 
      subject.top_up(10)
      subject.touch_in(old_street)
    end
    
    it 'reduces balance by minimum fare on touch out' do
      expect{ subject.touch_out(kings_cross) }.to change{ subject.balance }.by (-Oystercard::MIN_FARE)
    end

  end

  describe 'minimum value' do
    it 'raises an error when touching in with a balance less or equal to one' do
      old_street = double("Old Street")
      expect{ subject.touch_in(old_street) }.to raise_error "Not enough credit"
    end
  end

  describe '#fare' do
      let(:old_street) {"Old Street"}
      let(:kings_cross) {"Kings Cross"}

      it 'returns the minimum fare if touch in and touch out' do
        subject.top_up(10)
        subject.touch_in(kings_cross)
        subject.touch_out(old_street)
        expect(subject.balance).to eq 8
      end

      it 'returns penalty fare if touch out, but no touch in' do
        subject.top_up(20)
        subject.touch_out(old_street)
        expect(subject.balance).to eq 14
      end

    it 'returns penalty fare if touch in, but no touch out' do
      subject.top_up(20)
      subject.touch_in(kings_cross)
      subject.touch_in(old_street)
      expect(subject.balance).to eq 14
    end
  end
end