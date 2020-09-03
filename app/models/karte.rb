class Karte < ApplicationRecord
  has_many :karte_users
  has_many :users, through: :karte_users
end
