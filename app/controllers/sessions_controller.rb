class SessionsController < ApplicationController

  def new
  end

  def create

  end

  def destroy
    binding.pry
    session.clear
    redirect_to "/"
  end

end
