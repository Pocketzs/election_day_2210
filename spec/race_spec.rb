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
end