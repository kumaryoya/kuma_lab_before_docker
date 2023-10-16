# frozen_string_literal: true

# Controller for managing actions related to zoos.
class ZoosController < ApplicationController
  def index
    @q = Zoo.ransack(params[:q])
    @zoos_by_area = @q.result(distinct: true).order(id: :asc).all.group_by(&:area)
  end

  def show
    @zoo = Zoo.find(params[:id])
  end
end
