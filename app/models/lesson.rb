class Lesson < ApplicationRecord
  self.table_name = "classes"
  self.primary_key = "classid"

  belongs_to :metaclass, foreign_key: "metaclassid"
  belongs_to :instructor, foreign_key: "instructorid"
end
