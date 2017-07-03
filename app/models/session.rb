class Session < ApplicationRecord
  self.primary_key = "sessionid"

  has_many :metaclasses, foreign_key: "sessionid"
  has_many :assignments, foreign_key: "sessionid"
  has_many :lessons, through: :metaclasses

  validates :sessionname, presence: true
  validates :sessionstartdate, presence: true
  validates :sessionenddate, presence: true
end
