class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  
  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)

    respond_to do |format|
      if @customer.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @customer.errors.full_messages, status: :unprocessable_entity }
      end
      
    end
  end

  def edit
  end

  def update
     respond_to do |format|
      if @customer.update(customer_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @customer.errors.full_messages, status: :unprocessable_entity }
      end
     
    end
  end


  def destroy
    @customer.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

private
  
  def set_customer
  	@customer = Customer.find(params[:id])
  end
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :email, :street, :zip, :city)
  end

end
