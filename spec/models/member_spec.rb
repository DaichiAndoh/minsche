require 'rails_helper'

RSpec.describe Member, type: :model do
    # 名、メール、パスワードがあれば有効な状態であること
    it "is valid with a name, email, and password_digest" do
      member = Member.new(
        name: "sample",
        email: "sample@sample.com",
        password_digest: "sample",
      )
      expect(member).to be_valid
    end
    
    # 名がなければ無効な状態であること
    it "is invalid without name" do
      member = Member.new(name: nil)
      member.valid?
      expect(member.errors[:name]).to include("can't be blank")
    end
    
    # メールアドレスがなければ無効な状態であること
    it "is invalid without an email address" do
      member = Member.new(email: nil)
      member.valid?
      expect(member.errors[:email]).to include("can't be blank")
    end
    
    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
      Member.create(
        name: "sample",
        email: "sample@sample.com",
        password: "sample",
        password_confirmation: "sample"
      )
      member = Member.new(
        name: "sample2",
        email: "sample@sample.com",
        password: "sample2",
        password_confirmation: "sample2"
      )
      member.valid?
      expect(member.errors[:email]).to include("has already been taken")
    end
end