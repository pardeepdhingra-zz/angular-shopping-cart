class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
  	@products = Product.paginate(:per_page=>per_page, :page=>params[:page])
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		render 'new'
  	else
  		redirect_to admin_products_path
  	end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def update
  end

  def destroy
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  private
    def set_product
      @product = Product.find_by_slug(params[:id])
    end

    def product_params
    	params.require(:product).permit(:title, :description, :sku, :price)
  	end
end