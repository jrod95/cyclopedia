class Bicycle < ApplicationRecord

  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews

end
