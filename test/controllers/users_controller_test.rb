require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # 各テストの実行前に呼ばれる
  setup do
    @user = users(:one)
  end

  # 各テストの実行後に呼ばれる
  teardown do
    # コントローラがキャッシュを使っている場合、テスト後にリセットしておくとよい
    Rails.cache.clear
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end 

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { name: "New Name" } }
    end
    assert_redirected_to user_url(User.last)
  end  

  test "should get edit" do
    get user_url(@user)
    assert_response :success
  end

  test "should show user" do
    # セットアップ時の@articleインスタンス変数を再利用
    get user_url(@user)
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_path
  end

  test "should update user" do
    patch user_url(@user), params: { user: { name: "updated" } }
    assert_redirected_to user_path(@user)
    # 更新されたデータをフェッチするために関連付けをリロードし、タイトルが更新されたというアサーションを行う
    @user.reload
    assert_equal "updated", @user.name
  end
end