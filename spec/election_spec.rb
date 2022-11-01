require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

describe Election do
  describe '#initialize' do
    it 'exists' do
      election = Election.new('2022')

      expect(election).to be_a(Election)
    end

    it 'has a year' do
      election = Election.new('2022')

      expect(election.year).to eq("2022")
    end

    it 'starts with an empty array for races' do
      election = Election.new('2022')

      expect(election.races).to eq([])
    end
  end

  describe '#add_race' do
    it 'adds a race' do
      election = Election.new('2022')
      race1 = Race.new("Virginia District 4 Representative")
      race2 = Race.new("Texas Governor")

      election.add_race(race1)
      election.add_race(race2)

      expect(election.races).to eq([race1, race2])
    end
  end
end