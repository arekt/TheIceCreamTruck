class Api::V1::PurchasesController < ApplicationController
  def index
    Purchase.all
  end

  def create
    Purchase.new(purchase_params)
  end

  private

    def purchase_params
      params.require(:order).permit(:id, :items)
    end
end
