class Student < ApplicationRecord
  self.primary_key = "studentid"

  has_many :student_metaclasses, foreign_key: "studentid"
  has_many :metaclasses, through: :student_metaclasses

  scope :by_company, -> (company) { where(company: company) }
end
