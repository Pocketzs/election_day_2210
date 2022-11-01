class Race
  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(attributes)
    new_can = Candidate.new(attributes)
    @candidates << new_can
    new_can
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    return false if open?
    @candidates.max_by {|candidate| candidate.votes}
  end
end
