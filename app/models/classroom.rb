class Classroom < ApplicationRecord
  belongs_to :board
  has_many :subjects
  has_many :users

  validates_presence_of :name
end
