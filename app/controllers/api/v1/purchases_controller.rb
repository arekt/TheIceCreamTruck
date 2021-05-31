class Api::V1::PurchasesController < ApplicationController
  def index
    Order.all #TODO
  end

  def create
    track = Truck.new(id: "track-0001")
    order = Order.build(purchase_params.to_h.merge(track: track))
    if order.error.present?
      return "SO SORRY!"
    else
      return "ENJOY!"
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:id, :purchase_items)
  end
end
