class User < ApplicationRecord

    ##acts_as_token_authenticatable
    
    has_many :attempts
    has_many :user_repo_progress

    has_many :reposoitories, through: :user_repo_progress

    belongs_to :board, optional: true
    belongs_to :classroom, optional: true

    validates_presence_of :name, :email, :dob, :mobile
end
