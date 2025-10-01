require "test_helper"

class MediaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get media_index_url
    assert_response :success
  end

  test "should get show" do
    get media_show_url
    assert_response :success
  end

  test "should get create" do
    get media_create_url
    assert_response :success
  end

  test "should get update" do
    get media_update_url
    assert_response :success
  end

  test "should get destroy#" do
    get media_destroy#_url
    assert_response :success
  end

  test "should get 1." do
    get media_1._url
    assert_response :success
  end

  test "should get Aller" do
    get media_Aller_url
    assert_response :success
  end

  test "should get dans" do
    get media_dans_url
    assert_response :success
  end

  test "should get le" do
    get media_le_url
    assert_response :success
  end

  test "should get projet" do
    get media_projet_url
    assert_response :success
  end

  test "should get Rails" do
    get media_Rails_url
    assert_response :success
  end
end
