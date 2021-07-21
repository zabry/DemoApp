require 'rails_helper'

RSpec.describe TestModule, type: :model do
  it { should belong_to(:chapter) }

  it { should have_many(:test_questions)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:no_of_qns) }
  it { should validate_presence_of(:time_taken) }
end
