require "test_helper"

class Admin::SkillsControllerTest < ActionDispatch::IntegrationTest

  test "#index スキル一覧取得" do
    get admin_skills_url
    assert_response :success
  end

  test "#new スキル登録フォームページの取得" do
    get new_admin_skill_url
    assert_response :success
  end 

  test "#create スキル新規フォームの動作確認" do
    assert_difference("Skill.count") do
      post admin_skills_url, params: { 
        skill: { 
          name: "草むしり検定",
        } 
      }
    end
    assert_redirected_to admin_skill_url(Skill.last)
  end  

  test "#edit スキル編集フォームページの取得" do
    @skill = skills(:kihon_joho)
    get edit_admin_skill_url(@skill)
    assert_response :success
  end

  test "#destroy スキル削除動作確認" do
    @skill = skills(:kihon_joho)
    assert_difference("Skill.count", -1) do
      delete admin_skill_url(@skill)
    end
    assert_redirected_to admin_skills_url
  end

  test "#show スキル詳細画面の表示"  do
    @skill = skills(:kihon_joho)
    get admin_skill_url(@skill)
    assert_response :success
  end

  test "#update スキル編集フォームの動作確認" do
    @skill = skills(:kihon_joho)
    patch admin_skill_url(@skill), params: { 
      skill: { 
        name: "温泉ソムリエ",
      } 
    }
    assert_redirected_to admin_skill_url(@skill)
    @skill.reload
    assert_equal "温泉ソムリエ", @skill.name
  end
end