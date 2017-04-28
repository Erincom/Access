module AssignmentsHelper
  def total_score(speaking, listening, grammar, vocabulary, reading)
    unless speaking.nil? || listening.nil? || grammar.nil? || vocabulary.nil? || reading.nil?
      (speaking + listening + grammar + vocabulary + reading).round(1)
    end
  end

  def remove_empty_scores(scores)
    scores = scores.reject { |score| score.student.blank? }
  end
end
