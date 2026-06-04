require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest

  test "#index ユーザ一覧取得" do
    get admin_users_url
    assert_response :success
  end

  test "#new ユーザ登録フォームページの取得" do
    get new_admin_user_url
    assert_response :success
  end 

  test "#create ユーザ新規フォームの動作確認" do
    assert_difference("User.count") do
      post admin_users_url, params: { 
        user: { 
          name: "岩間匠",
          furigana: "イワマタクミ",
          gender: "男",
          department_id: departments(:pd3).id,
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
          skill_ids: [skills(:kihon_joho).id, skills(:neko_kentei).id]
        } 
      }
    end
    puts response.body 
    assert_redirected_to admin_user_url(User.last)
  end  

  test "#edit ユーザ編集フォームページの取得" do
    @user = users(:test_data_1)
    get edit_admin_user_url(@user)
    assert_response :success
  end

  test "#show ユーザ詳細画面の表示" do
    @user = users(:test_data_1)
    get admin_user_url(@user)
    assert_response :success
  end

  test "#destroy ユーザ削除動作確認" do
    @user = users(:test_data_1)
    assert_difference("User.count", -1) do
      delete admin_user_url(@user)
    end
    assert_redirected_to admin_users_path
  end

  test "#update ユーザ編集フォームの動作確認" do
    @user = users(:test_data_1)
    patch admin_user_url(@user), params: { 
      user: { 
        name: "岩間匠",
        furigana: "イワマタクミ",
        gender: "男",
        department_id: departments(:pd4).id,
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
        skill_ids: [skills(:boki).id]
      } 
    }
    puts response.body 
    assert_redirected_to admin_user_url(@user)
    
    @user.reload
    assert_equal "岩間匠", @user.name
    assert_equal "イワマタクミ", @user.furigana
    assert_equal "男", @user.gender
    assert_equal departments(:pd4).id, @user.department_id
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
    assert_equal [skills(:boki).id], @user.skill_ids
  end
end