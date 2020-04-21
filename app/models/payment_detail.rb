class PaymentDetail < ApplicationRecord
  belongs_to :order

  validates :account_number, presence: true, numericality: { greater_than_or_equal_to: 1000000000, less_than_or_equal_to: 9999999999, message: 'must be between 1000000000 - 9999999999'}
  validates :issuing_bank, presence: true, numericality: { greater_than_or_equal_to: 10000, less_than: 99999, message: 'must be between 10000 - 99999' }

  def payment_information
    "Account Number: #{account_number} - Issuing Bank: #{issuing_bank}"
  end
end
