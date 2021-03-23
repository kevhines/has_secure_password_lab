class SessionsController < ApplicationController

    def create
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'
    end

    def new
      @user = User.new
    end




end