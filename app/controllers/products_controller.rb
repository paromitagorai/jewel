class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy] 
  before_action :authenticate_user!, except: [:index, :show]
  # GET /products
  
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 20)
  end
  
 
  # GET /products/new
  def new
   @product = Product.new
   @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save(product_params)
      flash[:notice] = "Jewellery Item was successfully created"
      redirect_to @product
    else
      render :new
    end
  end
  
  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      flash[:notice] = "Jewellery Item was successfully updated"
      redirect_to @product
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    flash[:notice] = "Jewellery Item was successfully destroyed"
    redirect_to products_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id, :photo)
    end
end
