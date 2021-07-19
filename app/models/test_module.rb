class TestModule < ApplicationRecord
  belongs_to :chapter
  has_many :test_questions
end
