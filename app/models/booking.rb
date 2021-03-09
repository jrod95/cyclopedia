class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bicycle, dependent: :destroy
end
