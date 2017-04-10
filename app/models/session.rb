class Session < ApplicationRecord
  self.primary_key = "sessionid"

  has_many :metaclasses, foreign_key: "sessionid"
end
