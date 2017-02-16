class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
    @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid wishlist #{params[:id]}"
    redirect_to welcome_home_url
    else
      render :show
    end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end


  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      flash[:notice] = "Wishlist was successfully created."
      redirect_to @cart
    else
      render :new
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    if @cart.update(cart_params)
      flash[:notice] = "Wishlist was successfully updated."
      redirect_to @cart
    else
      render :edit
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    flash[:notice] = "Your Wishlist is currently empty"
    redirect_to root_url
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
     @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end
end
