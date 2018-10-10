require 'test_helper'

class Front::PostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get front_post_images_index_url
    assert_response :success
  end

end
