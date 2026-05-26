require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  # 各テストの実行後に呼ばれる

  test "メインページの表示" do
    get skills_url
    assert_response :success
  end

  test "新規登録ページのフォーム作成" do
    get new_skill_url
    assert_response :success
  end 

  test "新規登録" do
    assert_difference("Skill.count") do
      post skills_url, params: { 
        skill: { 
          name: "草むしり検定",
        } 
      }
    end
    assert_redirected_to skill_url(Skill.last)
  end  

  test "スキル情報登録ページのフォーム作成" do
    @skill = skills(:skill1)
    get edit_skill_url(@skill)
    assert_response :success
  end

  test "スキル情報削除" do
    @skill = skills(:skill1)
    assert_difference("Skill.count", -1) do
      delete skill_url(@skill)
    end
    assert_redirected_to skills_path
  end

  test "スキル情報詳細表示" do
    @skill = skills(:skill1)
    get skill_url(@skill)
    assert_response :success
  end

  test "情報更新" do
    @skill = skills(:skill1)
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