require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # 各テストの実行後に呼ばれる

  test "メインページの表示" do
    get users_url
    assert_response :success
  end

  test "新規登録ページのフォーム作成" do
    get new_user_url
    assert_response :success
  end 

  test "新規登録" do
    assert_difference("User.count") do
      post users_url, params: { user: { name: "New Name" } }
    end
    assert_redirected_to user_url(User.last)
  end  

  test "ユーザ情報登録ページのフォーム作成" do
    @user = users(:one)
    get user_url(@user)
    assert_response :success
  end

  test "ユーザ情報詳細表示" do
    @user = users(:one)
    get user_url(@user)
    assert_response :success
  end

  test "ユーザ情報削除" do
    @user = users(:one)
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_path
  end

  test "情報更新" do
    @user = users(:one)
    patch user_url(@user), params: { user: { name: "updated" } }
    assert_redirected_to user_path(@user)
    # 更新されたデータをフェッチするために関連付けをリロードし、タイトルが更新されたというアサーションを行う
    @user.reload
    assert_equal "updated", @user.name
  end
end