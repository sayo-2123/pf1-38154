class Post < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image


  # validates :post_title, presence: true
end
