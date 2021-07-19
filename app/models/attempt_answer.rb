class AttemptAnswer < ApplicationRecord
  belongs_to :attempt
  belongs_to :test_question
end
