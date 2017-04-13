module AssignmentsHelper
  def total_score(speaking, listening, grammar, vocabulary, reading)
    speaking + listening + grammar + vocabulary + reading
  end
end
