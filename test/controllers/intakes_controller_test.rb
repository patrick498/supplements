require "test_helper"

class IntakesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get intakes_index_url
    assert_response :success
  end
end
