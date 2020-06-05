require 'rails_helper'

RSpec.describe "Toppage", type: :request do
  # 200レスポンスを返すこと
  it "returns a 200 response" do
    get root_path
    expect(response).to have_http_status "200"
  end
end
