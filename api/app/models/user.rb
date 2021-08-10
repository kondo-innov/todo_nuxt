class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  ################################################################################################
  # アソシエーション
  ################################################################################################
  has_one_attached :image
  has_many :events, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

end