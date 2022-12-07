class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :doggie, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :taken_medications, through: :medications
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
