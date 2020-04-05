class PaymentDetail < ApplicationRecord
  belongs_to :order

  validates :account_number, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 100000, message: 'must be smaller than 100000' }
  validates :issuing_bank, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 10000000000, message: 'must be smaller than 10000000000' }

  def payment_information
    "Account Number: #{account_number} - Issuing Bank: #{issuing_bank}"
  end
end
