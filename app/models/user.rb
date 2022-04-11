class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
  validates :username, presence: true
  validates :selfintro, presence: true, length: { maximum: 200 }, on: :update
  validates :avatar, presence: true, on: :update
end
