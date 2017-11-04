require 'test_helper'

class RakutenSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rakuten_search_index_url
    assert_response :success
  end

  test "should get create" do
    get rakuten_search_create_url
    assert_response :success
  end

end
