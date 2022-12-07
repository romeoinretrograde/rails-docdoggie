class Medication < ApplicationRecord
  belongs_to :user
  has_many :taken_medications, dependent: :destroy
end
