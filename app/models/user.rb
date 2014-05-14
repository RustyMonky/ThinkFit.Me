class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of :name, :gender, :height, :weight 
  validates_presence_of :email, uniqueness: true
  validates_presence_of :password, length: { minimum: 6 }

  has_many :goals

  has_many :activities, through: :goals
  has_many :teams

  has_many :comments
end

