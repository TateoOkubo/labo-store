class ToppageController < ApplicationController
    def home
       @items = Item.all
    end
end
