class SessionsController < ApplicationController

  def new
  end
def index
    @sessions = Session.all
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
       log_in user
       redirect_to user
    else
       flash.now[:danger] = 'Invalid email/password combination'
       render 'new'
    end
  end

 def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end






end
