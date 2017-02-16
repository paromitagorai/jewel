class HomeController < ApplicationController
  
  def cart
    @cart = current_cart
  end
end
