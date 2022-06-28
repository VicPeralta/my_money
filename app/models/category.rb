class Category < ApplicationRecord
  belongs_to :user
  has_many :entities
  has_one_attached :image
end
