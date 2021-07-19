require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it { should belong_to(:board) }

  it { should have_many(:subjects)}
  it { should validate_presence_of(:name) }
end
