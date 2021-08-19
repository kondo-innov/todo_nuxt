class Tweet < ApplicationRecord
  ################################################################################################
  # アソシエーション
  ################################################################################################
  has_one_attached :picture

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :tweet_comments, dependent: :destroy
  has_many :like_lists, dependent: :destroy

  ################################################################################################
  # バリデーション
  ################################################################################################
  validates :description, presence: true, length: { maximum: 100 }

end
