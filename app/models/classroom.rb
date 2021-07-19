class Classroom < ApplicationRecord
  belongs_to :board
  has_many :subjects

  validates_presence_of :name
end
