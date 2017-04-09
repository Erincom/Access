class Instructor < ApplicationRecord
  self.primary_key = "instructorid"

  has_many :metaclasses, foreign_key: "metaclassinstructorid"
end
