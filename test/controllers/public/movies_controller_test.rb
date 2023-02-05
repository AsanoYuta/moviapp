require "test_helper"

class Public::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_movies_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_movies_edit_url
    assert_response :success
  end
end
