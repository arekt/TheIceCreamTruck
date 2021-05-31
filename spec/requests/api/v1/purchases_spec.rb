require 'rails_helper'

RSpec.describe "Purchase", type: :request do
  let(:order_params) { attributes_for :order }

  describe "POST /api/v1/purchases" do
    it "returns http success" do
      post "/api/v1/purchases", params: { order: order_params }
      expect(response).to have_http_status(:success)
    end
  end
end
