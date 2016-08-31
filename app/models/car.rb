class Car < ActiveRecord::Base
    has_many :orders

    after_initialize :init

    validates :brand, :model, :license_plat, :fare, presence: true
    validates :license_plat, uniqueness: true

    before_save :capitalize_and_trim

    def init
        self.fare ||= 0.0           #will set the default value only if it's nil
    end

    def capitalize_and_trim
        self.brand = self.brand.strip.upcase
        self.model = self.model.strip.upcase
        self.license_plat = self.license_plat.gsub(/\s+/, "").upcase
    end


end