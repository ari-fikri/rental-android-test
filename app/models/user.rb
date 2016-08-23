class User < ActiveRecord::Base
    validates :name, :address, :mobile, presence: true
    validates :mobile, uniqueness: true
end
