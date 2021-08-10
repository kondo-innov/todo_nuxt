class Tweet < ApplicationRecord
  has_one_attached :picture

  belongs_to :user
  has_many :likes, dependent: :destroy

end
