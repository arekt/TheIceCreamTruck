class Api::V1::PurchasesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :build_truck

  def index
    Order.all #TODO
  end

  def create
    order = Order.build(truck: @truck, purchase_items: build_purchase_items)

    if order.error.present?
      render json: "SO SORRY!"
    else
      render json: "ENJOY!"
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:id, purchase_items: [ :name, :flavor])
  end

  def build_purchase_items
    purchase_params.to_h.with_indifferent_access.dig(:purchase_items).map do |item|
      FoodItem.new(item)
    end
  end

  def build_truck
    return @truck if @truck.present?

    @truck = Truck.new(id: "truck-0001")
    @truck.inventory << FoodItem.new(price: 100, name: "Ice Cream", flavor: "Chocolate")
    @truck.inventory << FoodItem.new(price: 100, name: "Ice Cream", flavor: "Chocolate")
    @truck.inventory << FoodItem.new(price: 200, name: "Ice Cream", flavor: "Pistacho")
    @truck.inventory << FoodItem.new(price: 200, name: "Ice Cream", flavor: "Pistacho")
    @truck.inventory << FoodItem.new(price: 100, name: "Ice Cream", flavor: "Strowberry")
    @truck.inventory << FoodItem.new(price: 100, name: "Ice Cream", flavor: "Strowberry")
    @truck.inventory << FoodItem.new(price: 130, name: "Shaved Ice")
    @truck.inventory << FoodItem.new(price: 130, name: "Shaved Ice")
    @truck.inventory << FoodItem.new(price: 130, name: "Shaved Ice")
    @truck.inventory << FoodItem.new(price: 230, name: "Snack Bar")
    @truck.inventory << FoodItem.new(price: 230, name: "Snack Bar")
    @truck
  end
end
