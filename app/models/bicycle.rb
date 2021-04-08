class Bicycle < ApplicationRecord

  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews

  include PgSearch::Model
  pg_search_scope :search_by_brand_model_and_activity,
    against: [ :brand, :model, :activity ],
    using: {
      tsearch: { prefix: true }
}

end