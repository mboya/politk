class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
  	#@users = User.all
  	@users = User.where.not("id=?", current_user.id).order("created_at DESC")
  end

  def show
  	@user = User.find(params[:id])
  end
end
