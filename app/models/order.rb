class Order < ActiveRecord::Base
    belongs_to :car
    belongs_to :user

    validates :start_date, :end_date, :car, :user, presence: true

    validate :start_date_must_be_less_than_end_date, :start_date_should_be_more_1_to_7_days_from_today, :rent_duration_max_3_days,
        :booked?, :booked_another_car?

    def start_date_must_be_less_than_end_date
        errors.add(:start_date, "should be less than End date") unless start_date < end_date
    end

    def start_date_should_be_more_1_to_7_days_from_today
        rent_day_from_today = (start_date - Date.today).to_i

        errors.add(:start_date, "should be at least tomorrow or maximum 7 days from now") if ((rent_day_from_today <= 0) || (rent_day_from_today > 7))
    end

    def rent_duration_max_3_days
        errors.add(:base, "Rent duration is maximum 3 days") if (end_date - start_date).to_i > 3
    end

    # Check if a given interval overlaps this interval    
    # ref: https://makandracards.com/makandra/984-test-if-two-date-ranges-overlap-in-ruby-or-rails
    def overlaps?(other)
        (self.start_date - other.end_date) * (other.start_date - self.end_date) >= 0
    end

    # check if car is booked at specified date range
    def booked?
        return if self.car.blank?
        #select all rent_dates for this car which start_date is higher than today
        Order.joins(:car).where("start_date > ? and cars.license_plat = ?", Date.today, self.car.license_plat).each do | existing_rent_date |
            if overlaps?(existing_rent_date)
                errors.add(:car, "is already booked within date range") 
                break
            end
        end
    end

    # Client is not rent another car at selected rent date.
    def booked_another_car?
        return if self.user.blank?
        Order.joins(:car).joins(:user).where("start_date > ? and users.id = ?", Date.today, self.user.id).each do | existing_rent_date |
            if overlaps?(existing_rent_date)
                errors.add(:user, "is already booked another car within date range") 
                break
            end
        end
    end

end
