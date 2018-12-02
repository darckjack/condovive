require 'test_helper'

class ApartmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apartments_index_url
    assert_response :success
  end

  test "should get show" do
    get apartments_show_url
    assert_response :success
  end

  test "should get create" do
    get apartments_create_url
    assert_response :success
  end

  test "should get update" do
    get apartments_update_url
    assert_response :success
  end

  test "should get delete" do
    get apartments_delete_url
    assert_response :success
  end

end
