require 'rails_helper'

RSpec.describe Group, type: :model do
  # 名、紹介文、コード、パスワードがあれば有効な状態であること
  it "is valid with a name, introduction, code, and password_digest" do
    group = Group.new(
      name: "sample",
      introduction: "This is a group!",
      code: 123,
      password_digest: "sample"
    )
    expect(group).to be_valid
  end
  
  # 名がなければ無効な状態であること
  it { is_expected.to validate_presence_of :name }
    
  # 紹介文がなければ無効な状態であること
  it { is_expected.to validate_presence_of :introduction }
  
  # 重複したコードなら無効な状態であること
  it { is_expected.to validate_uniqueness_of(:code) }
  
  #コールバック勉強用
  it "can have many notes" do
    group = FactoryBot.create(:group, :with_schedules)
    expect(group.schedules.length).to eq 5
  end
end