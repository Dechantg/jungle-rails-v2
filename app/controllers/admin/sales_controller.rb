class Admin::SalesController < ApplicationController

  before_action :authenticate

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to [:admin, :sales], notice: 'Sale created!'
    else
      render :new
    end
  end

  private

    def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end

  def sale_params
    params.require(:sale).permit(:name, :percent_off, :starts_on, :ends_on)
  end
  
  end
  