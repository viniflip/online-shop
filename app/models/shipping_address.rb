class ShippingAddress < ApplicationRecord
  belongs_to :order

  validates_presence_of :name, :street, :zip_code, :country

  def user_information
    "#{name} - #{email}"
  end

  def address_information
    "#{street}, #{zip_code} - #{country}"
  end
end
