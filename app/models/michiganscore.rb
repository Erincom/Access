class Michiganscore < ApplicationRecord
  self.table_name = "michiganscores"
  self.primary_key = "testscoreid"

  belongs_to :assignment, foreign_key: "assignmentid"
  belongs_to :student, foreign_key: "studentid"

  def recalibrate_listening_score
    if self.assignment.assignmentdate < Date.new(2013,01,01)
      self.listeningscore = ((self.listeningscore / 20.0) * 25).round(1) unless self.listeningscore.nil?
    else
      self.listeningscore
    end
  end

  def recalibrate_grammar_score
    if self.assignment.assignmentdate < Date.new(2013,01,01)
      self.grammarscore = ((self.grammarscore / 30.0) * 20).round(1) unless self.listeningscore.nil?
    else
      self.grammarscore
    end
  end

  def recalibrate_vocab_score
    if self.assignment.assignmentdate < Date.new(2013,01,01)
      self.vocabscore = ((self.vocabscore / 30.0) * 20).round(1) unless self.listeningscore.nil?
    else
      self.vocabscore
    end
  end

  def recalibrate_read_score
    if self.assignment.assignmentdate < Date.new(2013,01,01)
      self.readscore = ((self.readscore / 20.0) * 15).round(1) unless self.listeningscore.nil?
    else
      self.readscore
    end
  end

end
