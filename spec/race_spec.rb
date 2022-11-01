require 'rspec'
require './lib/race'
require './lib/candidate'
require './lib/election'

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

    it 'stores new candidates in candidates array' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})

      expect(race.candidates).to eq [candidate1, candidate2]
    end
  end

  describe '#open?' do
    it 'starts true by default' do
      race1 = Race.new("Texas Governor")

      expect(race1.open?).to be true
    end
  end

  describe '#close!' do
    it 'closes the race' do
      race1 = Race.new("Texas Governor")

      race1.close!

      expect(race1.open?).to be false
    end
  end

  describe '#winner' do
    it 'returns false until race is closed' do
      race1 = Race.new("Texas Governor")

      expect(race1.winner).to be false
    end

    it 'returns the candidate with most votes' do
      race1 = Race.new("Texas Governor")
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})

      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}

      race1.close!

      expect(race1.winner).to eq candidate1
    end

    it 'returns any candidate with highest votes if tie' do
      race2 = Race.new("Virginia District 4 Representative")
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})

      1.times {candidate3.vote_for!}
      6.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}

      race2.close!

      expect(race2.winner).to eq candidate4
    end
  end
end