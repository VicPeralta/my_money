class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, presence: { message: "Name can't be blank" }
  validates :amount, presence: { message: "Amount can't be nothing" }
  validates :amount, numericality: { only_float: true, greater_than: 0, message: 'Amount must be greater than 0' }
end
