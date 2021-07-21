require 'rails_helper'

RSpec.describe UserRepoProgress, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:reposoitory) }

  it { should validate_presence_of(:progress) }

end
