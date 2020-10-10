class Admin::UsersController < ApplicationController
	before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def update
    @customer.update(customer_params) ? (redirect_to admin_customer_path(@customer)) : (render :edit)
  end

end
