class Product < ApplicationRecord
  acts_as_paranoid
  validates_presence_of :title, :description, :price
end
