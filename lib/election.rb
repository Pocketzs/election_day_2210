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
    candidates = @races.flat_map do |race|
      race.candidates
    end
  end

  def vote_counts
    vote_counts = candidates.each_with_object({}) do |candidate, hash|
      hash[candidate.name] = candidate.votes 
    end
  end
end
