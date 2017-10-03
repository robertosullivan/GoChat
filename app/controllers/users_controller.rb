class UsersController < ApplicationController
 	def index

  end  

  def show
      @user = current_user
      @comment = @user.comments
  end

	def new
  		@user = User.new
	end

	def create
  		@user = User.new(user_params)
  		if @user.save
    	session[:user_id] = @user.id
    	redirect_to new_comment_path, notice: "Thank you for signing up!"
  		else
    	render "new"
  		end
	end 

  def destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def edit
    @user = current_user
  end  

  def update
      @user = current_user
      @user.update(user_params)
      redirect_to @user
  end  

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
