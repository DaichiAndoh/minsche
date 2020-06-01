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
  it "is invalid without name" do
    group = FactoryBot.build(:group, name: nil)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end
    
  # 紹介文がなければ無効な状態であること
  it "is invalid without an introduction" do
    group = FactoryBot.build(:group, introduction: nil)
    group.valid?
    expect(group.errors[:introduction]).to include("can't be blank")
  end
  
  # 重複したコードなら無効な状態であること
  it "is invalid with a duplicate code" do
    FactoryBot.create(:group, code: 123)
    group = FactoryBot.build(:group, code: 123)
    group.valid?
    expect(group.errors[:code]).to include("has already been taken")
  end
  
  
  #コールバック勉強用
  it "can have many notes" do
    group = FactoryBot.create(:group, :with_schedules)
    expect(group.schedules.length).to eq 5
  end
end