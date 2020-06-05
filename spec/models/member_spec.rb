require 'rails_helper'

RSpec.describe Member, type: :model do
  # 名、メール、パスワードがあれば有効な状態であること
  it "is valid with a name, email, and password" do
    member = Member.new(
      name: "sample",
      email: "sample@sample.com",
      password: "sample"
    )

    expect(member).to be_valid
  end
  
  # 名がなければ無効な状態であること
  it { is_expected.to validate_presence_of :name }
  
  # メールアドレスがなければ無効な状態であること
  it { is_expected.to validate_presence_of :email }
  
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:member, email: "sample@sample.com")
    member = FactoryBot.build(:member, email: "sample@sample.com")
    member.valid?
    expect(member.errors[:email]).to include("has already been taken")
  end
  # it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

end