class Reposoitory < ApplicationRecord
  belongs_to :chapter

  validates_presence_of :name, :filepath
end
