require 'rspec'
require './lib/candidate.rb'

describe Candidate do
  describe '#initialize' do
    it 'exists' do
      diana = Candidate.new({name: "Diana D", party: :democrat})

      expect(diana).to be_a Candidate
    end

    it 'has attributes' do
      diana = Candidate.new({name: "Diana D", party: :democrat})
      charles = Candidate.new({name: "Charles F", party: :republican})
      
      expect(diana.name).to eq "Diana D"
      expect(diana.party).to eq :democrat

      expect(charles.name).to eq "Charles F"
      expect(charles.party).to eq :republican
    end

    it 'starts with 0 votes' do
      diana = Candidate.new({name: "Diana D", party: :democrat})

      expect(diana.votes).to eq 0
    end
  end
end