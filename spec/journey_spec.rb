require 'journey'

describe Journey do

    describe '#starts' do
        let(:old_street) {"Old Street"}
        
        it 'returns entry station after touch in' do
            subject.starts(old_street)
            expect(subject.entry_station).to eq old_street
        end
    end

    describe '#ends' do
        let(:old_street) {"Old Street"}
        let(:kings_cross) {"Kings Cross"}
        before(:each) {subject.starts(old_street)}


        it 'after touching out, exit station is set' do
            expect{ subject.ends(kings_cross) }.to change{ subject.exit_station }.to kings_cross
        end
    end


    describe "#reset" do
        let(:old_street) {"Old Street"}

        it 'resets the entry and exit stations' do
            subject.starts("Old Street")
            subject.reset
            expect(subject.entry_station).to eq nil
        end
    end
end