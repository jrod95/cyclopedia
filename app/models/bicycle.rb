class Bicycle < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :photo
end
