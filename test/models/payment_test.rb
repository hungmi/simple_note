require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  test "the truth" do
    payment = payments(:one)
    assert payment.valid?, payment.errors.full_messages
  end
end
