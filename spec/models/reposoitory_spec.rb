require 'rails_helper'

RSpec.describe Reposoitory, type: :model do
  it { should belong_to(:chapter) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:filepath) }
end
