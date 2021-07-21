class UserRepoProgress < ApplicationRecord
  belongs_to :user
  belongs_to :reposoitory

  validates_presence_of(:progress)
end
