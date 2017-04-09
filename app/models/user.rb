class User < ApplicationRecord
  attr_accessor :invite
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :invite, :on => :create, presence: true, inclusion: { in: [Figaro.env.invitation_code] }
end
