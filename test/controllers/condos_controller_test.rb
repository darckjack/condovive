require 'test_helper'

class CondosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get condos_index_url
    assert_response :success
  end

  test "should get show" do
    get condos_show_url
    assert_response :success
  end

end
