class SalesController < ApplicationController
  def index
    @sales = Sale.includes(:product, :buyer, :provider).all
    @amount = @sales.map(&:product).map(&:amount).sum
  end
end
