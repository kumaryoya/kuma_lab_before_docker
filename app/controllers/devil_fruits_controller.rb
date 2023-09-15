class DevilFruitsController < ApplicationController
  def index; end

  def crush; end

  def result
    @name = params[:name]
    if @name.blank?
      @error_message = "名前を入力してください"
    else
      @devil_fruit = DevilFruitGem::FormatDevilFruit.random_devil_fruit
      @devil_fruit_array = @devil_fruit.split(" ")
      @devil_fruit_first = @devil_fruit_array[0]
    end
    render 'index'
  end
end
