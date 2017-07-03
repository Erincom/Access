class Lesson < ApplicationRecord
  self.table_name = "classes"
  self.primary_key = "classid"

  belongs_to :metaclass, foreign_key: "metaclassid"
  belongs_to :instructor, foreign_key: "instructorid"
  has_one :session, through: :metaclass

  has_many :student_lessons, foreign_key: "classid"
  has_many :students, through: :student_lessons
end
