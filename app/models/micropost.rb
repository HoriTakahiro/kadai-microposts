class Micropost < ApplicationRecord
  belongs_to :user
  has_many :reverse_of_favorite, class_name: 'Favorite', foreign_key: 'user_id'
  has_many :favorite_users, through: :reverse_of_favorite, source: :user

  validates :content, presence: true, length: { maximum: 255 }
end