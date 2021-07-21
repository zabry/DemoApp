require 'rails_helper'

RSpec.describe Board, type: :model do

  
  it { should have_many(:classrooms) }
  it { should validate_presence_of(:name) }
end
