require "test_helper"

class UserSupplementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_supplements_index_url
    assert_response :success
  end
end
