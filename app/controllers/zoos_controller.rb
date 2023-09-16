class ZoosController < ApplicationController
  def top; end

  def index
    @q = Zoo.ransack(params[:q])
    @zoos_by_area = @q.result(distinct: true).order(id: :asc).all.group_by(&:area)
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  def map
    @zoos = Zoo.all
  end

  def recommend
    @zoos = Zoo.all
  end
end
