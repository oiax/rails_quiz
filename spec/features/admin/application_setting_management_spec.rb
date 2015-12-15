require 'rails_helper'

feature '管理者によるアプリケーション設定' do
  include FeaturesSpecHelper
  let(:administrator) { create(:administrator) }

  before do
    switch_namespace(:admin)
    login_as_administrator(administrator)
    click_link 'アプリケーション設定'
  end

  scenario '管理者がアプリケーションの各種設定を正しく更新する' do
    fill_in 'アプリケーション名', with: 'Zeus'
    fill_in 'セッションタイムアウト(分)', with: '1000000'
    click_button '更新'

    expect(current_path).to eq admin_root_path
    expect(page).to have_content 'アプリケーション設定を変更しました。'
    within 'header' do
      expect(page).to have_content 'Zeus'
    end
  end

  scenario '管理者がアプリケーションの各種設定に不正な値を入力する' do
    fill_in 'アプリケーション名', with: ''
    fill_in 'セッションタイムアウト(分)', with: '-1'
    click_button '更新'

    expect(current_path).to eq admin_application_setting_path
    expect(page).to have_content 'アプリケーション設定の入力値が正しくありません。'
  end
end
