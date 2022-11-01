class Election
  attr_reader :year,
              :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    candidates = @races.map do |race|
      race.candidates
    end.flatten
  end

  def vote_counts
    vote_counts = Hash.new
    candidates.map do |candidate|
      vote_counts[candidate.name] = candidate.votes
    end
    vote_counts
  end
end
