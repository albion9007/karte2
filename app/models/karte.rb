class Karte < ApplicationRecord
  has_many :karte_users
  has_many :users, through: :karte_users
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :karte_id
    validates :image
    validates :patient_name
    validates :main_disease
    validates :main_doctor
  end
end
