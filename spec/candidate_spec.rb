require 'rspec'
require './lib/candidate.rb'

describe Candidate do
  describe '#initialize' do
    it 'exists' do
      diana = Candidate.new({name: "Diana D", party: :democrat})

      expect(diana).to be_a Candidate
    end
  end
end