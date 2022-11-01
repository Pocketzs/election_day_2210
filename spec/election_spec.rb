require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

describe Election do
  describe '#initialize' do
    it 'exists' do
      election = Election.new('2022')
    end
  end
end