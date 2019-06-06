class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)

    render("product_templates/index.html.erb")
  end

  def show
    @review = Review.new
    @product = Product.find(params.fetch("id_to_display"))

    render("product_templates/show.html.erb")
  end

  def new_form
    @product = Product.new

    render("product_templates/new_form.html.erb")
  end

  def create_row
    @product = Product.new

    @product.category = params.fetch("category")
    @product.company_id = params.fetch("company_id")
    @product.serial_no = params.fetch("serial_no")

    if @product.valid?
      @product.save

      redirect_back(:fallback_location => "/products", :notice => "Product created successfully.")
    else
      render("product_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @product = Product.find(params.fetch("prefill_with_id"))

    render("product_templates/edit_form.html.erb")
  end

  def update_row
    @product = Product.find(params.fetch("id_to_modify"))

    @product.category = params.fetch("category")
    @product.company_id = params.fetch("company_id")
    @product.serial_no = params.fetch("serial_no")

    if @product.valid?
      @product.save

      redirect_to("/products/#{@product.id}", :notice => "Product updated successfully.")
    else
      render("product_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @product = Product.find(params.fetch("id_to_remove"))

    @product.destroy

    redirect_to("/products", :notice => "Product deleted successfully.")
  end
end
