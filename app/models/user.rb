class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable
  has_many :orders, dependent: :destroy

  ROLE = %w(admin general)
end
