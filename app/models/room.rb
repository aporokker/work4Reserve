class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :roomname, presence: true, length: { maximum: 20 }
  validates :image, presence: true
  validates :info, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to:1 }
  validates :address, presence: true, length: { in: 5..50 }
end
