# frozen_string_literal: true

class Api::V1::ProductsController < Api::BaseController
  def show
    id = id_param['id']
    @product = Product.find(id)
  end

  def index
    @products = Product.all
  end

  private

  def id_param
    params.permit(:id)
  end
end
