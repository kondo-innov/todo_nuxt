class Event < ApplicationRecord
  ################################################################################################
  # アソシエーション
  ################################################################################################
  belongs_to :user
  has_many :event_comments, dependent: :destroy
  has_many :joins, dependent: :destroy
end
