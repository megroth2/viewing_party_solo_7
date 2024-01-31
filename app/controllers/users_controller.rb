class UsersController < ApplicationController

   def new
      @user = User.new
   end

   def show
      @user = User.find(params[:id])
   end

   def create
      user = User.new(user_params)
      if user.save
         flash[:success] = 'Successfully Created New User'
         redirect_to user_path(user)
      else
         flash[:error] = "#{error_message(user.errors)}"
         redirect_to register_user_path
      end
   end

   def discover
      @user = User.find_by(id: params[:id])
      # flash[:alert] = "Error: user does not exist" unless @user # i moved this error to the discover view because the error was staying on the page until i refreshed it twice. I'm not sure why.
   end


private

  def user_params
      params.require(:user).permit(:name, :email)
  end

end