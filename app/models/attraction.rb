class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides
  # write associations here
end
