require "test_helper"

module Admin
  class DepartmentsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = users(:test_data_1) 
      post '/admin/login', params: { email: @user.email }
    end

    test "#index 部署一覧取得" do
      get admin_departments_url
      assert_response :success
    end

    test "#new 部署登録フォームページの取得" do
      get new_admin_department_url
      assert_response :success
    end 

    test "#create 部署新規フォームの動作確認" do
      assert_difference("Department.count", 1) do
        post admin_departments_url, params: { 
          department: { 
            name: "PD6",
          } 
        }
      end
      assert_redirected_to admin_department_url(Department.last)
    end  

    test "#edit 部署編集フォームページの取得" do
      @department = departments(:pd1)
      get edit_admin_department_url(@department)
      assert_response :success
    end

    test "#destroy 部署削除動作確認" do
      @department = departments(:pd7)
      assert_difference("Department.count", -1) do
        delete admin_department_url(@department)
      end
      assert_redirected_to admin_departments_url
    end

    test "#show 部署詳細画面の表示" do
      @department = departments(:pd1)
      get admin_department_url(@department)
      assert_response :success
    end

    test "#update 部署編集フォームの動作確認" do
      @department = departments(:pd1)
      patch admin_department_url(@department), params: { 
        department: { 
          name: "PD5",
        } 
      }
      assert_redirected_to admin_department_url(@department)
      @department.reload
      assert_equal "PD5", @department.name
    end
  end
end