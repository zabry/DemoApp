class TestModule < ApplicationRecord
  belongs_to :chapter
  has_many :test_questions

  validates_presence_of :name, :no_of_qns, :time_taken
end
