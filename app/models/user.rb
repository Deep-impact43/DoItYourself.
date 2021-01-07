class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :recipes, dependent: :destroy
  mount_uploader :profile_image, ProfileImageUploader

  with_options presence: true do
    validates :username
    validates :email
  end
end
