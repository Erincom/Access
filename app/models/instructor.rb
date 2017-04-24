class Instructor < ApplicationRecord
  self.primary_key = "instructorid"

  has_many :metaclasses, foreign_key: "metaclassinstructorid"
  has_many :lessons, foreign_key: "instructorid"

  validates :instructor, presence: true
end
