class UsersController < ApplicationController
  def index
  	#@users = User.all
  	@users = User.where.not("id=?", current_user.id).order("created_at DESC")
  end

  def show
  end
end
