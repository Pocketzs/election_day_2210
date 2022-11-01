require 'rspec'
require './lib/race'
require './lib/candidate'

describe Race do
  describe '#initialize' do
    it 'exists' do
      race = Race.new("Texas Governor")

      expect(race).to be_a Race
    end
  end
end