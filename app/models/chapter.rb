class Chapter < ApplicationRecord
  belongs_to :subject
  has_many :reposoitories
  has_many :test_modules

  validates_presence_of :name
end
