class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :last_10_photos, -> { self.all.order(created_at: :desc).limit(10) }
end
