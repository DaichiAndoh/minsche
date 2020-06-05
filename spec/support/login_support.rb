module LoginSupport
  def sign_in_as(member)
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: member.email
    fill_in "パスワード", with: member.password
    click_button "ログイン"
  end
end

RSpec.configure do |config|
   config.include LoginSupport
end
