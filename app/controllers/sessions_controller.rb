class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    respond_to do |format|
      if @user && @user.authenticate(params[:session][:password])
        puts "Debug Code Params:"
        puts "Session created"
        puts "User_id:"
        puts @user.id.to_s

        session[:user_id] = @user.id

        puts "Session:"
        puts session.to_s

        puts "Format:"
        puts format.to_s

        format.html { redirect_to '/home', notice: 'Session was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
        format.json { render json: @user, status: :created }
      else
        puts "Debug Code Params:"
        puts "NO Session created!"

        puts params
        format.html { redirect_to 'login' }
        # format.json { render "users/show", status: :created, location: @user }

        # format.json { render json: @session.errors, status: :unprocessable_entity }
        format.json {  }
      end

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
