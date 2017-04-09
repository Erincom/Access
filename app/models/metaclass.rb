class Metaclass < ApplicationRecord
  self.table_name = "metaclasses"
  self.primary_key = "metaclassid"

  belongs_to :instructor, foreign_key: "metaclassinstructorid"
  has_many :student_metaclasses, foreign_key: "metaclassid"
  has_many :students, through: :student_metaclasses
end
