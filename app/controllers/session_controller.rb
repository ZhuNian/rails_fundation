class SessionController < ApplicationController
  def show
  end

  def new
  end

  def login
    @user = User.find_by(email:params[:data][:email],password:params[:data][:password])
      if @user
        render json: {status:'OK'}
      else
        redirect_to new_url
        flash[:notice] = 'Invalid email/password combination'
      end
    rescue
      render json: {status:'ERROR'}
  end
end
