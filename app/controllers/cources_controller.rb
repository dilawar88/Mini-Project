class CourcesController < ApplicationController
before_action :logged_in_user,only: [:index, :edit, :destroy, :show, :Cources   ]
skip_before_filter :require_login,only: [:edit,:update, :show, :edit, :Cources ]
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

