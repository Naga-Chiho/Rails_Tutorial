require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "#index ユーザ一覧取得" do
    get users_url
    assert_response :success
  end

  test "#show ユーザ詳細画面の表示" do
    @user = users(:test_data_1)
    get user_url(@user)
    assert_response :success
  end
end