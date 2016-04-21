class UsersController < ApplicationController
	def new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/notifications'
		else
			redirect_to '/signup'
		end
	end

	def edit
	end

	def update
		respond_to do |format|
      if @user.update(notification_params)
        format.html { redirect_to notifications_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
