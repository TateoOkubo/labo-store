class ItemsController < ApplicationController
  def new
    @items = Item.all
  end
end
