require 'rspec'
require './lib/race'
require './lib/candidate'

describe Race do
  describe '#initialize' do
    it 'exists' do
      race = Race.new("Texas Governor")

      expect(race).to be_a Race
    end

    it 'has an office' do
      race = Race.new("Texas Governor")

      expect(race.office).to eq "Texas Governor"
    end

    it 'starts with an empty array of candidates' do
      race = Race.new("Texas Governor")

      expect(race.candidates).to eq []
    end
  end

  describe '#register_candidate!' do
    it 'creates a new candidate instance' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})

      expect(candidate1).to be_a Candidate
      expect(candidate1.name).to eq "Diana D"
      expect(candidate1.party).to eq :democrat
    end
  end
end