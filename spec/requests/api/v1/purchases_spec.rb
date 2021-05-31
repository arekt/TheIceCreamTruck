require 'rails_helper'

RSpec.describe "Purchase", type: :request do
  #let(:order_params) { attributes_for :order }
  let(:headers) {
    { "CONTENT_TYPE" => "application/json" }
  }
  let(:valid_order_params) {
    {
      purchase_items:[
        FoodItem.new(price: 230, name: "Snack Bar"),
        FoodItem.new(price: 100, name: "Ice Cream", flavor: "Strowberry")
      ]
    }
  }

  let(:invalid_order_params) {
    {
      purchase_items:[
        FoodItem.new(price: 230, name: "Snack Bar"),
        FoodItem.new(price: 230, name: "Snack Bar"),
        FoodItem.new(price: 230, name: "Snack Bar"),
        FoodItem.new(price: 230, name: "Snack Bar"),
        FoodItem.new(price: 230, name: "Snack Bar")
      ]
    }
  }

  describe "POST /api/v1/purchases" do
    describe "success" do
      it "returns ENJOY when order is successful" do
        post "/api/v1/purchases", params: { order: valid_order_params }.to_json, headers: headers
        expect(response).to have_http_status(:success)
        expect(response.body).to match("ENJOY!")
      end
    end

    describe "failure" do
      it "returns SO SORRY! when order failed " do
        post "/api/v1/purchases", params: { order: invalid_order_params }.to_json, headers: headers
        expect(response).to have_http_status(:success)
        expect(response.body).to match("SO SORRY!")
      end
    end
  end
end
