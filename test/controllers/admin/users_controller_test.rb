# frozen_string_literal: true

require 'test_helper'

module Admin
  class UsersControllerTest < ActionDispatch::IntegrationTest
    setup do
      user = users(:test_data_1)
      login_as user
    end

    test '#index ユーザ一覧取得' do
      get admin_users_url
      assert_response :success
    end

    test '#new ユーザ登録フォームページの取得' do
      get new_admin_user_url
      assert_response :success
    end

    test '#create ユーザ新規フォームの動作確認' do
      assert_difference('User.count') do
        post admin_users_url, params: {
          user: {
            name: '岩間匠',
            furigana: 'イワマタクミ',
            gender: '男',
            department_id: departments(:pd1).id,
            phone: '086-749-2481',
            mobile_phone: '090-5535-0024',
            email: 'cwiwdlnwtakumi56147@ipun.jjn.rsg',
            postal_code: '710-0053',
            prefecture: '岡山県',
            city: '倉敷市',
            town: '東町',
            street: '2-19-18',
            building: '東町アパート316',
            birthday: '1987/04/16',
            skill_ids: [skills(:kihon_joho).id, skills(:neko_kentei).id],
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end
      puts response.body
      assert_redirected_to admin_user_url(User.last)
    end

    test '#edit ユーザ編集フォームページの取得' do
      @user = users(:test_data_1)
      get edit_admin_user_url(@user)
      assert_response :success
    end

    test '#show ユーザ詳細画面の表示' do
      @user = users(:test_data_1)
      get admin_user_url(@user)
      assert_response :success
    end

    test '#destroy ユーザ削除動作確認' do
      @user = users(:test_data_1)
      assert_difference('User.count', -1) do
        delete admin_user_url(@user)
      end
      assert_redirected_to admin_users_path
    end

    test '#update ユーザ編集フォームの動作確認' do
      @user = users(:test_data_1)
      patch admin_user_url(@user), params: {
        user: {
          name: '岩間匠',
          furigana: 'イワマタクミ',
          gender: '男',
          department_id: departments(:pd2).id,
          phone: '086-749-2481',
          mobile_phone: '090-5535-0024',
          email: 'cwiwdlnwtakumi56147@ipun.jjn.rsg',
          postal_code: '710-0053',
          prefecture: '岡山県',
          city: '倉敷市',
          town: '東町',
          street: '2-19-18',
          building: '東町アパート316',
          birthday: '1987/04/16',
          skill_ids: [skills(:boki).id],
          password: 'password',
          password_confirmation: 'password'
        }
      }
      puts response.body
      assert_redirected_to admin_user_url(@user)

      @user.reload
      assert_equal '岩間匠', @user.name
      assert_equal 'イワマタクミ', @user.furigana
      assert_equal '男', @user.gender
      assert_equal departments(:pd2).id, @user.department_id
      assert_equal '086-749-2481', @user.phone
      assert_equal '090-5535-0024', @user.mobile_phone
      assert_equal 'cwiwdlnwtakumi56147@ipun.jjn.rsg', @user.email
      assert_equal '710-0053', @user.postal_code
      assert_equal '岡山県', @user.prefecture
      assert_equal '倉敷市', @user.city
      assert_equal '東町', @user.town
      assert_equal '2-19-18', @user.street
      assert_equal '東町アパート316', @user.building
      assert_equal '1987-04-16', @user.birthday.to_s
      assert_equal [skills(:boki).id], @user.skill_ids
    end

    test '名前で検索ができるか' do
      get admin_users_path, params: { name: '三井碧透' }
      assert_response :success

      list_html = css_select('li').to_s

      assert_match '三井碧透', list_html
      assert_no_match '石山光彦', list_html
    end

    test '都道府県で検索ができるか' do
      get admin_users_path, params: { prefecture: '三重県' }
      assert_response :success

      list_html = css_select('li').to_s

      assert_match '石山光彦', list_html
      assert_no_match '三井碧透', list_html
    end

    test '表示件数が指定した件数になるか' do
      get admin_users_path, params: { per_page: 1 }
      assert_response :success

      assert_select 'li', count: 1
    end

    test '誕生日が昇順に並ぶか' do
      get admin_users_path, params: { birthday: 'asc' }
      assert_response :success

      list_html = css_select('li').to_s
      assert list_html.index('石山光彦') < list_html.index('三井碧透')
    end
  end
end
