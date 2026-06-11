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

  test "名前で検索ができるか" do
    get users_path, params: { name: "三井碧透" }
    assert_response :success
    
    assert_match "三井碧透", @response.body
    assert_no_match "石山光彦", @response.body
  end

  test "都道府県で検索ができるか" do
    get users_path, params: { prefecture: "三重県" }
    assert_response :success

    assert_match "石山光彦", @response.body
    assert_no_match "三井碧透", @response.body
  end

  test "表示件数が指定した件数になるか" do
    get users_path, params: { per_page: 1 }
    assert_response :success
    
    assert_select "li", count: 1
  end

    test "誕生日が昇順に並ぶか" do
      get users_path, params: { birthday: "asc" }
      assert_response :success
     
      assert @response.body.index("石山光彦") < @response.body.index("三井碧透")
    end

end