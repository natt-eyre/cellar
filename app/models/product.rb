class Product < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :quantity, presence: true
end
