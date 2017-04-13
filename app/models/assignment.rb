class Assignment < ApplicationRecord
  self.primary_key = "assignmentid"

  belongs_to :session, foreign_key: "sessionid"
  has_many :michiganscores, foreign_key: "assignmentid"

  def assignment_name
    "#{self.session.sessionname} - #{self.assignmentdescription}"
  end
end
