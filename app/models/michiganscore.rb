class Michiganscore < ApplicationRecord
  self.table_name = "michiganscores"
  self.primary_key = "testscoreid"

  belongs_to :assignment, foreign_key: "assignmentid"
  belongs_to :student, foreign_key: "studentid"
end
