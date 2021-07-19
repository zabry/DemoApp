class Board < ApplicationRecord
    has_many :classrooms

    validates_presence_of :name
end
