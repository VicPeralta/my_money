class Category < ApplicationRecord
  belongs_to :user
  has_many :entities
  has_one_attached :image
  validates :name, presence: { message: "Name can't be blank" }
end
