class Flight < ApplicationRecord
    validates :origin, :destination, :departure, :arrival, :fcfare, :bcfare, :ecfare, presence: true
    belongs_to :aeroplane
    has_many :bookings, dependent: :destroy

    def available_seats
    total_seats
    end

    private

    def total_seats
        aeroplane.seats
    end
end
