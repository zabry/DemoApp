class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :test_module

  has_many :attempt_answers
end
