class AttemptAnswer < ApplicationRecord
  belongs_to :attempt
  belongs_to :test_question

  validates_presence_of :user_answer
end
