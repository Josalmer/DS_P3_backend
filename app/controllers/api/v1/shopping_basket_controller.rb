# frozen_string_literal: true

class Api::V1::UserProfilesController < Api::BaseController
  before_action :load_user_basket

  def show; end

  def buy
    money_left = current_api_v1_user.money - @basket.total_cost
    if money_left >= 0
      current_api_v1_user.update_columns(money: money_left)
      @basket.products = []
      (render json: { basket: @basket })
    else
      (render json: { errors: 'No tiene dinero suficiente' }, status: 500)
    end
  end

  def add
    product = Product.find(add_or_remove_params['product_id'])
    if product
      @basket.products << product
      (render json: { basket: @basket })
    else
      (render json: { errors: 'No se ha podido añadir el producto a la cesta' }, status: 500)
    end
  end

  def remove
    product = Product.find(add_or_remove_params['product_id'])
    if product
      @basket.products.delete(product)
      (render json: { basket: @basket })
    else
      (render json: { errors: 'No se ha podido eliminar el producto de la cesta' }, status: 500)
    end
  end

  def update
    current_api_v1_user.update_attributes(user_params) unless user_params.empty?
    @user = current_api_v1_user
  end

  private

  def load_user_basket
    @basket = ShoppingBasket.by_user(current_api_v1_user.id).first
  end

  def add_or_remove_params
    params.permit(:product_id)
  end
end
