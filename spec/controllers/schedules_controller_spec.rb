require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do
  # describe '#show' do
  #   # 認証済みのユーザーとして
  #   context "as an authenticated member" do
  #     before do
  #       member = FactoryBot.create(:member)
  #       session[:member_id] = member.id
  #       @group = FactoryBot.create(:group, first_creator_id: member.id)
  #       @schedule = @group.schedules.create(
  #         title: "Practice",
  #         start_time: "2020-05-27 12:00:00",
  #         end_time: "2020-05-27 18:00:00"
  #       )
  #     end
      
  #     # 正常にレスポンスを返すこと
  #     it 'responds successfully' do
  #       get :show, params: { group_id: @group.id, id: @schedule.id }
  #       expect(response).to be_success
  #     end
      
  #     # 200レスポンスを返すこと
  #     it "returns a 200 response" do
  #       get :show, params: { group_id: @group.id, id: @schedule.id }
  #       expect(response).to have_http_status "200"
  #     end
  #   end
    
  #   # ゲストとして
  #   context "as a guest" do
  #     # 302レスポンスを返すこと
  #     it "returns a 302 response" do
  #       get :show
  #       expect(response).to have_http_status "302"
  #     end
        
  #     # サインイン画面にリダイレクトすること
  #     it "redirects to the sign-in page" do
  #       get :show
  #       expect(response).to redirect_to "/login"
  #     end
  #   end
  # end
end
