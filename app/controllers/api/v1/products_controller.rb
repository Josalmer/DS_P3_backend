# frozen_string_literal: true

class Api::V1::ProductsController < Api::BaseController
  def show
    @product = Product.find(id_param)
  end

  def index
    @products = Product.all
  end

  private

  def id_param
    params.permit(:id)
  end
end
