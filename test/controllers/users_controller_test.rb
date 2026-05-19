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
      post users_url, params: { 
        user: { 
          name: "岩間匠",
          furigana: "イワマタクミ",
          gender: "男",
          phone: "086-749-2481",
          mobile_phone: "090-5535-0024",
          email: "cwiwdlnwtakumi56147@ipun.jjn.rsg",
          postal_code: "710-0053",
          address1: "岡山県",
          address2: "倉敷市", 
          address3: "東町",
          address4: "2-19-18",
          address5: "東町アパート316",
          birthday: "1987/04/16"
        } 
      }
    end
    assert_redirected_to user_url(User.last)
  end  

  test "ユーザ情報登録ページのフォーム作成" do
    @user = users(:test_data_1)
    get edit_user_url(@user)
    assert_response :success
  end

  test "ユーザ情報詳細表示" do
    @user = users(:test_data_1)
    get user_url(@user)
    assert_response :success
  end

  test "ユーザ情報削除" do
    @user = users(:test_data_1)
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_path
  end

  test "情報更新" do
    @user = users(:test_data_1)
    patch user_url(@user), params: { 
      user: { 
        name: "岩間匠",
        furigana: "イワマタクミ",
        gender: "男",
        phone: "086-749-2481",
        mobile_phone: "090-5535-0024",
        email: "cwiwdlnwtakumi56147@ipun.jjn.rsg",
        postal_code: "710-0053",
        address1: "岡山県",
        address2: "倉敷市", 
        address3: "東町",
        address4: "2-19-18",
        address5: "東町アパート316",
        birthday: "1987/04/16"
      } 
    }
    assert_redirected_to user_url(@user)
    @user.reload
    assert_equal "岩間匠", @user.name
  end
end