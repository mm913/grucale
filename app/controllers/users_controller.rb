class UsersController < ApplicationController

  def index
  end
  
  def show
    @name = current_user.name  
  end

end
