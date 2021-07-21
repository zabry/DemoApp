class TestQuestion < ApplicationRecord
  belongs_to :test_module

  validates_presence_of(:question, :choice1, :choice2, :choice3, :choice4, :answer)
end
