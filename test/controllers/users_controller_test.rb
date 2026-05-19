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
        name: "佐竹 千裕",
        furigana: "サタケ チヒロ",
        gender: "女",
        phone: "098-292-5566",
        mobile_phone: "",
        email: "osatake@maaaesdm.iwlzu.cwe",
        postal_code: "907-1432",
        address1: "沖縄県",
        address2: "八重山郡竹富町", 
        address3: "古見",
        address4: "2-3-5",
        address5: "",
        birthday: "1944-01-21"
      } 
    }
    assert_redirected_to user_path(@user)
    # 更新されたデータをフェッチするために関連付けをリロードし、タイトルが更新されたというアサーションを行う
    @user.reload
    assert_equal "佐竹 千裕", @user.name
    assert_equal "サタケ チヒロ", @user.furigana
    assert_equal "女", @user.gender
    assert_equal "098-292-5566", @user.phone
    assert_equal "", @user.mobile_phone
    assert_equal "osatake@maaaesdm.iwlzu.cwe", @user.email
    assert_equal "907-1432", @user.postal_code
    assert_equal "沖縄県", @user.address1
    assert_equal "八重山郡竹富町", @user.address2
    assert_equal "古見", @user.address3
    assert_equal "2-3-5", @user.address4
    assert_equal "", @user.address5
    assert_equal "1944-01-21", @user.birthday
  end
end