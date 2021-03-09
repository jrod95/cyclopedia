class Bicycle < ApplicationRecord

  belongs_to :user, dependent: :destroy
  has_one_attached :photo
  has_many :bookings
  has_many :reviews

end
