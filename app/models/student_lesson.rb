class StudentLesson < ApplicationRecord
  self.table_name = "studentsclasses"
  self.primary_key = "studentclassid"

  belongs_to :student, foreign_key: "studentid"
  belongs_to :lesson, foreign_key: "classid"
end
