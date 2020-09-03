class KarteUser < ApplicationRecord
  belongs_to :karte
  belongs_to :user
end
