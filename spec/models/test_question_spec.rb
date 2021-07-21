require 'rails_helper'

RSpec.describe TestQuestion, type: :model do
  it { should belong_to(:test_module) }

  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:choice1) }
  it { should validate_presence_of(:choice2) }
  it { should validate_presence_of(:choice3) }
  it { should validate_presence_of(:choice4) }
  it { should validate_presence_of(:answer) }
end
