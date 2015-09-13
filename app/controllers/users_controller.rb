class UsersController < ApplicationController
before_action :logged_in_user,only: [:index, :edit, :destroy, :show, :cource   ]
skip_before_filter :require_login,only: [:edit,:update, :show, :edit, :cource ]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def new
    @user = User.new
    @title = "Sign up"
  end
  
def show
@user = User.find_by_id(params[:id])

  end

def Cources
@user = User.find_by_id(params[:id])

  end

   def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end

    end
  end

  def edit
      @user = User.find_by_id(params[:id])
      @title = "Edit Profile"
  
  end

   def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
    flash[:success] = "Profile updated."
    redirect_to @user
  else
    @title = "Edit user"
    render 'edit'
  end
end

 def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
      def user_params
        params.require(:user).permit(:name,:email,:edit,:password,
                                     :password_confirmation)
     end

# Confirms a logged-in user.
def logged_in_user
unless logged_in?
flash[:danger] = "Please log in."
redirect_to login_url
end
end

     def correct_user
@user = User.find_by_id(params[:id])
# redirect_to(root_url) unless current_user?(@user)
redirect_to(root_url) unless @user == current_user
end


end
