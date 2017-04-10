class Metaclass < ApplicationRecord
  self.table_name = "metaclasses"
  self.primary_key = "metaclassid"

  belongs_to :instructor, foreign_key: "metaclassinstructorid"
  belongs_to :session, foreign_key: "sessionid"
  has_many :student_metaclasses, foreign_key: "metaclassid"
  has_many :students, through: :student_metaclasses

  validates :metaclassname, presence: true, uniqueness: true
  validates :metaclassdaytime, presence: true
  validates :metaclasslocation, presence: true
end
