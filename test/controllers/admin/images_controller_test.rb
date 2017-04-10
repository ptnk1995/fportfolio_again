require 'test_helper'

class Admin::ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_images_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_images_create_url
    assert_response :success
  end

end
