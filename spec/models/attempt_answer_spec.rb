require 'rails_helper'

RSpec.describe AttemptAnswer, type: :model do
  it { should belong_to(:attempt) }
  it { should belong_to(:test_question) }


  it { should validate_presence_of(:user_answer) }
end
