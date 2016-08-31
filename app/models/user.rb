class User < ActiveRecord::Base
    has_many :orders

    validates :name, :address, :mobile, presence: true
    validates :mobile, uniqueness: true
end
