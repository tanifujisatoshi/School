require 'test_helper'

class LunchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lunches_index_url
    assert_response :success
  end

end
