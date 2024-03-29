require "rails_helper"

describe "Home", type: :request do
  let(:user) { create(:user) }
  it "tests home" do
    get '/admin/v1/home', headers: auth_header(user)
    expect(response).to have_http_status(:ok)
  end
end