require 'test_helper'

class DepartmentControllerTest < ActionDispatch::IntegrationTest
  test '#index スキル一覧取得' do
    get departments_url
    assert_response :success
  end

  test '#show 部署詳細画面の表示' do
    @department = departments(:pd1)
    get department_url(@department)
    assert_response :success
  end
end
