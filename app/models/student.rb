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
end
