# frozen_string_literal: true

class Api::V1::CategoriesController < Api::BaseController
  def show
    @category = Category.find(id_param)
  end

  def index
    @categories = Category.all
  end

  private

  def id_param
    params.permit(:id)
  end
end
