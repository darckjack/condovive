require 'test_helper'

class FeesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fees_create_url
    assert_response :success
  end

  test "should get pay" do
    get fees_pay_url
    assert_response :success
  end

  test "should get unpaid" do
    get fees_unpaid_url
    assert_response :success
  end

  test "should get paid" do
    get fees_paid_url
    assert_response :success
  end

end
