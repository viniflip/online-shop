class PaymentDetail < ApplicationRecord
  belongs_to :order

  def payment_information
    "Account Number: #{account_number} - Issuing Bank: #{issuing_bank}"
  end
end
