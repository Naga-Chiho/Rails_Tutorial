require "test_helper"

class DepartmentControllerTest < ActionDispatch::IntegrationTest
  # 各テストの実行後に呼ばれる

  test "#index スキル一覧取得" do
    get departments_url
    assert_response :success
  end

  test  "#new 部署登録フォームページの取得"  do
    get new_department_url
    assert_response :success
  end 

  test "#create 部署新規フォームの動作確認" do
    assert_difference("Department.count") do
      post departments_url, params: { 
        department: { 
          name: "にゃんにゃん",
        } 
      }
    end
    assert_redirected_to department_url(Department.last)
  end  

  test "#edit スキル編集フォームページの取得" do
    @department = departments(:pd1)
    get edit_department_url(@department)
    assert_response :success
  end

  test "#destroy 部署削除動作確認" do
    @department = departments(:pd1)
    assert_difference("User.count", -1) do
      delete department_url(@department)
    end
    assert_redirected_to departments_path
  end

  test "#show 部署詳細画面の表示" do
    @department = departments(:pd1)
    get department_url(@department)
    assert_response :success
  end

  test "#update 部署編集フォームの動作確認"do
    @department = departments(:pd1)
    patch department_url(@department), params: { 
      department: { 
        name: "さくらんぼ",
      } 
    }
    assert_redirected_to department_url(@department)
    @department.reload
    assert_equal "さくらんぼ", @department.name
  end
end