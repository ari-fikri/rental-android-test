# class AvailabilityValidator < ActiveModel::AvailabilityValidator
#     def validate(record)
#         unless ['AVAILABLE', 'RENTED'].include? record.availability.upcase
#            record.errors[:availability] << 'Status is NOT valid'
#     end
# end

class Car < ActiveRecord::Base
    has_many :orders

    after_initialize :init

    validates :brand, :model, :license_plat, :fare, :availability, presence: true
    validates :license_plat, uniqueness: true

    validate :check_availability_status

    before_save :capitalize_and_trim

    def init
        self.fare ||= 0.0           #will set the default value only if it's nil
        self.availability ||= 'AVAILABLE'
    end

    def capitalize_and_trim
        self.brand = self.brand.strip.upcase
        self.model = self.model.strip.upcase
        self.license_plat = self.license_plat.gsub(/\s+/, "").upcase
    end

    def check_availability_status
        errors.add(:availability, "Status is NOT valid") unless ['AVAILABLE', 'RENTED'].include? availability.strip.upcase
    end

end