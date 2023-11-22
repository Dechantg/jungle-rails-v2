class Admin::SalesController < ApplicationController

  before_action :authenticate

  def index
    @sales = Sale.all
  end
  
  end
  