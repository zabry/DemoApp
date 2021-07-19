class Subject < ApplicationRecord
  belongs_to :classroom
  has_many :chapters

  validates_presence_of :name
end
