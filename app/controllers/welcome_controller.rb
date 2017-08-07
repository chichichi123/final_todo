

class WelcomeController < ApplicationController

  def index
    if logged_in?
      redirect_to "/todo_lists"
    end


  end
end
