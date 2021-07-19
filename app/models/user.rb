class User < ApplicationRecord

    ##acts_as_token_authenticatable
    
    has_one :board
    has_one :classroom
end
