require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  # 各テストの実行後に呼ばれる

  test "#index スキル一覧取得" do
    get skills_url
    assert_response :success
  end

  test "#new スキル登録フォームページの取得" do
    get new_skill_url
    assert_response :success
  end 

  test "#create スキル新規フォームの動作確認" do
    assert_difference("Skill.count") do
      post skills_url, params: { 
        skill: { 
          name: "草むしり検定",
        } 
      }
    end
    assert_redirected_to skill_url(Skill.last)
  end  

  test "#edit スキル編集フォームページの取得" do
    @skill = skills(:kihon_joho)
    get edit_skill_url(@skill)
    assert_response :success
  end

  test "#destroy スキル削除動作確認" do
    @skill = skills(:kihon_joho)
    assert_difference("Skill.count", -1) do
      delete skill_url(@skill)
    end
    assert_redirected_to skills_path
  end

  test "#show スキル詳細画面の表示"  do
    @skill = skills(:kihon_joho)
    get skill_url(@skill)
    assert_response :success
  end

  test "#update スキル編集フォームの動作確認" do
    @skill = skills(:kihon_joho)
    patch skill_url(@skill), params: { 
      skill: { 
        name: "温泉ソムリエ",
      } 
    }
    assert_redirected_to skill_url(@skill)
    @skill.reload
    assert_equal "温泉ソムリエ", @skill.name
  end
end