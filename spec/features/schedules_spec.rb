require 'rails_helper'

RSpec.feature "Schedules", type: :feature do
  # 管理者は新しい予定を作成する
  # scenario "member creates a new group" do
  #   member = FactoryBot.create(:member)
  #   group = FactoryBot.create(:group)
  #   member.be_first_creator(group)
    
  #   sign_in_as member
    
  #   visit group_schedules_path(group_id: group.id)
    
  #   expect {
  #     click_link "予定を追加"
  #     fill_in "タイトル", with: "練習"
  #     select "2020", from: "開始時間"
  #     select "May", from: "開始時間"
  #     select "27", from: "開始時間"
  #     select "12", from: "開始時間"
  #     select "00", from: "開始時間"
  #     select "終了時間", with: "2020-05-27 18:00:00"
  #     fill_in "場所", with: "Aグラウンド"
  #     fill_in "詳細", with: "今週末に試合があるので気を引き締めていきましょう！"
  #     click_button "予定追加"
      
  #     expect(page).to have_content "予定を追加しました"
  #     expect(page).to have_content group.name
  #     expect(page).to have_content "グループ作成者：#{member.name}"
  #     expect(page).to have_content "This is a group!"
  #   }.to change(member.groups, :count).by(1)
  # end
end