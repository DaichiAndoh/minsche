require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  
  describe '#new' do
    # 認証済みのユーザーとして
    context "as an authenticated member" do
      before do
        member = FactoryBot.create(:member)
        session[:member_id] = member.id
      end
      
      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        get :new
        expect(response).to be_success
      end
      
      # 200レスポンスを返すこと
      it "returns a 200 response" do
        get :new
        expect(response).to have_http_status "200"
      end
    end
    
    # ゲストとして
    context "as a guest" do
      # 302レスポンスを返すこと
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end
        
      # ログイン画面にリダイレクトすること
      it "redirects to the sign-in page" do
        get :new
        expect(response).to redirect_to "/login"
      end
    end
  end
  
  describe '#create' do
    # 認証済みのユーザーとして
    context "as an authenticated member" do
      before do
        @member = FactoryBot.create(:member)
        session[:member_id] = @member.id
      end
      
      # 有効な属性値の場合
      context "with valid attributes" do
        # グループを作成できること
        it 'adds groups' do
          group_params = FactoryBot.attributes_for(:group)
          expect {
            post :create, params: { group: group_params }
          }.to change(@member.groups, :count).by(1)
        end
      end
      
      # 無効な属性値の場合
      context "with valid attributes" do
        # プロジェクトを追加できないこと
        it "does not add a project" do
          group_params = FactoryBot.attributes_for(:group, :invalid)
          expect {
            post :create, params: { group: group_params } 
          }.to_not change(@member.groups, :count)
        end
      end
    end
    
    # ゲストとして
    context "as a guest" do
      # 302レスポンスを返すこと
      it "returns a 302 response" do
        group_params = FactoryBot.attributes_for(:group) 
        post :create, params: { group: group_params }
        expect(response).to have_http_status "302"
      end
      # ログイン画面にリダイレクトすること
      it "redirects to the sign-in page" do
        group_params = FactoryBot.attributes_for(:group) 
        post :create, params: { group: group_params }
        expect(response).to redirect_to "/login"
      end 
    end
  end
  
  describe '#edit' do
    # 認証済みのユーザーとして
    context "as an authenticated member" do
      before do
        member = FactoryBot.create(:member)
        session[:member_id] = member.id
        @group = FactoryBot.create(:group, first_creator_id: member.id)
      end
      
      # 正常にレスポンスを返すこと
      it 'responds successfully' do
        get :edit, params: { id: @group.id }
        expect(response).to be_success
      end
      
      # 200レスポンスを返すこと
      it "returns a 200 response" do
        get :edit, params: { id: @group.id }
        expect(response).to have_http_status "200"
      end
    end
  end
  
  describe "#destroy" do
    # 認可されたユーザーとして
    context "as an authorized user" do
      before do
        @member = FactoryBot.create(:member)
        session[:member_id] = @member.id
        @group = FactoryBot.create(:group, first_creator_id: @member.id)
      end
      # グループを削除できること
      it "deletes a group" do
        expect {
          delete :destroy, params: { id: @group.id }
        }.to change(@member.groups, :count).by(0)
      end 
    end
    
    # 認可されていないユーザーとして
    context "as an unauthorized user" do
    end
  end
end
