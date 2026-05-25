require "test_helper"

class DepartmentControllerTest < ActionDispatch::IntegrationTest
  # 各テストの実行後に呼ばれる

  test "メインページの表示" do
    get departments_url
    assert_response :success
  end

  test "新規登録ページのフォーム作成" do
    get new_department_url
    assert_response :success
  end 

  test "新規登録" do
    assert_difference("Department.count") do
      post departments_url, params: { 
        department: { 
          name: "にゃんにゃん",
        } 
      }
    end
    assert_redirected_to department_url(Department.last)
  end  

  test "部署情報登録ページのフォーム作成" do
    @department = departments(:development1)
    get edit_department_url(@department)
    assert_response :success
  end

  test "部署情報削除" do
    @department = departments(:development1)
    assert_difference("User.count", -1) do
      delete department_url(@department)
    end
    assert_redirected_to departments_path
  end

  test "部署情報詳細表示" do
    @department = departments(:development1)
    get department_url(@department)
    assert_response :success
  end

  test "情報更新" do
    @department = departments(:development1)
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