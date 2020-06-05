require 'rails_helper'
include RequestSpecHelper

RSpec.describe "Groups", type: :request do
  # 認証済みのユーザーとして
  context "as an authenticated member" do
    before do
      @member = FactoryBot.create(:member)
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(member_id: @member.id)
      # session[:member_id] = member.id
    end
    
    # 有効な属性値の場合
    context "with valid attributes" do
      # グループを作成できること
      it 'adds groups' do
        group_params = FactoryBot.attributes_for(:group)
        expect {
          post groups_path, params: { group: group_params }
        }.to change(@member.groups, :count).by(1)
      end
    end
    
    # 無効な属性値の場合
    context "with valid attributes" do
      # プロジェクトを追加できないこと
      it "does not add a project" do
        group_params = FactoryBot.attributes_for(:group, :invalid)
        expect {
          post groups_path, params: { group: group_params } 
        }.to_not change(@member.groups, :count)
      end
    end
  end
  
  # ゲストとして
  context "as a guest" do
    # 302レスポンスを返すこと
    it "returns a 302 response" do
      group_params = FactoryBot.attributes_for(:group) 
      post groups_path, params: { group: group_params }
      expect(response).to have_http_status "302"
    end
    # ログイン画面にリダイレクトすること
    it "redirects to the sign-in page" do
      group_params = FactoryBot.attributes_for(:group) 
      post groups_path, params: { group: group_params }
      expect(response).to redirect_to "/login"
    end 
  end
end