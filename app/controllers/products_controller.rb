class ProductsController < ApplicationController

  def create
    @store = Store.find(params[:store_id])
    @product = @store.products.build(product_params)
    if @product.save
      redirect_to @store
    else
      flash[:error]= "error save"
      redirect_to root_path
    end
  end

  def virtual_cart
    if @product = Product.find_by(id: params[:product_id])
      if session[:cart].nil?
        session[:cart] ||= []
        product = [params[:store_id].to_i, @product.id, @product.name, @product.price, 1] 
        session[:cart] << product
      else
        check = true
        session[:cart].map do |product| 
          if product[1] == @product.id
            check = false
            product[4] += 1
          end
        end
        if check == true
          product = [params[:store_id].to_i, @product.id, @product.name, @product.price, 1] 
          session[:cart] << product
        end  
      end
    end
    redirect_to store_path(params[:store_id])
  end

  def destroy_cart
    path = session[:cart][-1][0]
    session[:cart] = nil
    redirect_to store_path(path)
  end

  def order
    session[:cart].each do |product|
      Order.create!(store_id: product[0], product_id: product[1], product_name: product[2], product_price: product[3], product_quantity: product[4], user_id: current_user.id)
    end
    @orders = Order.where(user_id: current_user.id)
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :product_image)
    end
end
