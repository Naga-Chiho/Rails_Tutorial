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
          department_id: departments(:development1).id,
          phone: "086-749-2481",
          mobile_phone: "090-5535-0024",
          email: "cwiwdlnwtakumi56147@ipun.jjn.rsg",
          postal_code: "710-0053",
          address1: "岡山県",
          address2: "倉敷市", 
          address3: "東町",
          address4: "2-19-18",
          address5: "東町アパート316",
          birthday: "1987/04/16",
          skill_ids: [skills(:skill1).id, skills(:skill2).id]
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
        department_id: departments(:development2).id,
        phone: "086-749-2481",
        mobile_phone: "090-5535-0024",
        email: "cwiwdlnwtakumi56147@ipun.jjn.rsg",
        postal_code: "710-0053",
        address1: "岡山県",
        address2: "倉敷市", 
        address3: "東町",
        address4: "2-19-18",
        address5: "東町アパート316",
        birthday: "1987/04/16",
        skill_ids: [skills(:skill4).id]
      } 
    }
    assert_redirected_to user_url(@user)
    @user.reload
    assert_equal "岩間匠", @user.name
    assert_equal "イワマタクミ", @user.furigana
    assert_equal "男", @user.gender
    assert_equal departments(:development2).id, @user.department_id
    assert_equal "086-749-2481", @user.phone
    assert_equal "090-5535-0024", @user.mobile_phone
    assert_equal "cwiwdlnwtakumi56147@ipun.jjn.rsg", @user.email
    assert_equal "710-0053", @user.postal_code
    assert_equal "岡山県", @user.address1
    assert_equal "倉敷市", @user.address2
    assert_equal "東町", @user.address3
    assert_equal "2-19-18", @user.address4
    assert_equal "東町アパート316", @user.address5
    assert_equal "1987-04-16", @user.birthday.to_s
    assert_equal [skills(:skill4).id], @user.skill_ids
  end
end