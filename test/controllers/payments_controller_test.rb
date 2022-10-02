require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "Payments require sign in to see" do
    get admin_payments_path
    assert_response :redirect

    sign_in_as users(:one)
    get admin_payments_path
    assert_response :success
  end

  test "logged in user only see his payments" do
    user1 = users(:one)
    user2 = users(:two)
    assert user1.payments.exists?
    assert user2.payments.exists?

    sign_in_as user1
    get admin_payments_path
    assert_select "a[href=?]", edit_admin_payment_path(id: user1.payments.first.id)
    assert_select "a[href=?]", edit_admin_payment_path(id: user2.payments.first.id), false
  end
end