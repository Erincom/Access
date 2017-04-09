class StudentMetaclass < ApplicationRecord
  self.table_name = "studentsmetaclasses"
  self.primary_key = "studentmetaclassid"

  belongs_to :student, foreign_key: "studentid"
  belongs_to :metaclass, foreign_key: "metaclassid"
end
