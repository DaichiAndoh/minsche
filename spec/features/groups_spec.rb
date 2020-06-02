require 'rails_helper'

RSpec.feature "Groups", type: :feature do
  # メンバーは新しいグループを作成する
  scenario "member creates a new group" do
    member = FactoryBot.create(:member)
    
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: member.email
    fill_in "パスワード", with: member.password
    click_button "ログイン"
    
    expect {
      within ".row" do
        click_link "グループ作成"
      end
      fill_in "グループ名", with: "Sample_Group"
      fill_in "グループ紹介文", with: "This is a group!"
      fill_in "コード", with: 123
      fill_in "パスワード", with: "sample"
      fill_in "パスワード（確認）", with: "sample"
      click_button "作成"
      
      expect(page).to have_content "グループを作成しました"
      expect(page).to have_content "Sample_Group"
      expect(page).to have_content "グループ作成者：#{member.name}"
      expect(page).to have_content "This is a group!"
    }.to change(member.groups, :count).by(1)
  end
end
