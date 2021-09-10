class UserEvent < ApplicationRecord
  ################################################################################################
  # アソシエーション
  ################################################################################################
  belongs_to :user
  belongs_to :event
  ################################################################################################
  # バリデーション
  ################################################################################################
  validates :user_id,  presence: true
  validates :event_id, presence: true
end