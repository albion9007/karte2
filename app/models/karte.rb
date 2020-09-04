class Karte < ApplicationRecord
  has_many :karte_users
  has_many :users, through: :karte_users
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
