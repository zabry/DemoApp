class Board < ApplicationRecord
    has_many :classrooms
    has_many :chapters, through: :classroom
    has_many :users

    validates_presence_of :name
end
