require 'rails_helper'

RSpec.describe Member, type: :model do
    # 姓、名、メール、パスワードがあれば有効な状態であること
    it "is valid with a name, email, password, and password_confirmation"
    # 名がなければ無効な状態であること
    it "is invalid without name"
    # メールアドレスがなければ無効な状態であること
    it "is invalid without an email address"
    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address"
    # パスワードとパスワード（確認）が同じであること
    it "is invalid if password isn't much password_confirmation"
end