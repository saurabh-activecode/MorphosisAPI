class CartsController < ApplicationController
  before_action :require_login
  before_action :retreive_user_and_cart

  # GET user cart by token
  def cart
    render json: CartPresenter.new(@user).open_cart
  end

  def add_product
    render json: @user.carts.open.cart_products.create(
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
  end

  def update_product
    status = :not_found
    data = nil
    if request.put? and (cart_product = @user.carts.open.cart_products.find_by(product_id: params[:product_id]))
      cart_product = @user.carts.open.cart_products.find_by(
        product_id: params[:product_id]
      )
      data = cart_product.update(quantity: params[:quantity])
      status = :ok
    end
    render json: data, status: status
  end

  def remove_product
    status = :not_found
    data = nil
    if request.delete?
      data = @user.carts.open.cart_products.find_by(
        product_id: params[:product_id]
      ).destroy
      status = :ok
    end
    render json: data, status: status
  end

  private

  def retreive_user_and_cart
    @user = User.find_by(id: current_user_id)
    @cart = @user.carts.open.present? ? @user.carts.open : @user.carts.create(region: @user.region)
  end
end
