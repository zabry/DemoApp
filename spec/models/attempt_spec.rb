require 'rails_helper'

RSpec.describe Attempt, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:test_module) }

  it { should have_many(:attempt_answers)}

end
