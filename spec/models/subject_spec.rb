require 'rails_helper'

RSpec.describe Subject, type: :model do
  it { should belong_to(:classroom) }

  it { should have_many(:chapters)}
  it { should validate_presence_of(:name) }
end
