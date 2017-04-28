class Student < ApplicationRecord
  self.primary_key = "studentid"

  has_many :student_metaclasses, foreign_key: "studentid"
  has_many :metaclasses, through: :student_metaclasses
  has_many :michiganscores, foreign_key: "studentid"

  scope :by_company, -> (company) { where(company: company) }

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :company, presence: true
  validates :originallevel, presence: true
  validates :currentlevel, presence: true
  validates :testscoredate, presence: true

  def student_name
    "#{self.lastname}, #{self.firstname}"
  end

  def self.list_companies
    select(:company).distinct.map(&:company)
  end

  def recalibrate_listening_score
    if self.testscoredate < Date.new(2013,01,01)
      self.listeningtestscore = ((self.listeningtestscore / 20.0) * 25).round(0)
    else
      self.listeningtestscore
    end
  end

  def recalibrate_grammar_score
    if self.testscoredate < Date.new(2013,01,01)
      self.grammartestscore = ((self.grammartestscore / 30.0) * 20).round(0)
    else
      self.grammartestscore
    end
  end

  def recalibrate_vocab_score
    if self.testscoredate < Date.new(2013,01,01)
      self.vocabtestscore = ((self.vocabtestscore / 30.0) * 20).round(0)
    else
      self.vocabtestscore
    end
  end

    def recalibrate_read_score
    if self.testscoredate < Date.new(2013,01,01)
      self.readingtestscore = ((self.readingtestscore / 20.0) * 15).round(0)
    else
      self.readingtestscore
    end
  end

end
