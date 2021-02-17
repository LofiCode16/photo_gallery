class Photo < ApplicationRecord
  belongs_to :user

  scope :last_10_photos, -> { self.all.order(created_at: :desc).limit(10) }
end
