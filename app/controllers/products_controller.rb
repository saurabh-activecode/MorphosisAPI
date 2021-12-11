class ProductsController < ApplicationController
  def index
    region = Region.find(params[:region_id])
    render json: Product.where(region: region)
  end
end
