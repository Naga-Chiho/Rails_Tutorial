require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test '#index スキル一覧取得' do
    get skills_url
    assert_response :success
  end

  test '#show スキル詳細画面の表示' do
    @skill = skills(:kihon_joho)
    get skill_url(@skill)
    assert_response :success
  end
end
