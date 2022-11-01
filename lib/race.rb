class Race
  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(attributes)
    new_can = Candidate.new(attributes)
    @candidates << new_can
    new_can
  end
end
