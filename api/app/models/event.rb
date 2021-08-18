class Event < ApplicationRecord
  ################################################################################################
  # アソシエーション
  ################################################################################################
  belongs_to :user
  has_many :event_comments, dependent: :destroy
  has_many :joins, dependent: :destroy

  ################################################################################################
  # バリデーション
  ################################################################################################
  validates :eventname, presence: true, length: { maximum: 20 }
  validates :datetime, presence: true
  validates :cityward, presence: true
  validates :streetaddress, presence: true
  validates :description, presence: true, length: { maximum: 1000 }

end
