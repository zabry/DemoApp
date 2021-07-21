class Reposoitory < ApplicationRecord
  belongs_to :chapter
  has_many :user_repo_progress

  validates_presence_of :name, :filepath
end
