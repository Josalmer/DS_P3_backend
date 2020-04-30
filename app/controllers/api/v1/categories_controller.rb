# frozen_string_literal: true

class Api::V1::CategoriesController < Api::BaseController
  def show
    id = id_param['id']
    @category = Category.find(id)
  end

  def index
    @categories = Category.all
  end

  private

  def id_param
    params.permit(:id)
  end
end
