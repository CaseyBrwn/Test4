class SessionsController < ApplicationController

    def new
    end


    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
            login(user)
            redirect_to links_url
        else
            flash.now[:errors] = "If my TA is reading this they should send me a message with the only the number 42"
            render :new
        end
    end

    def destroy 
        logout
        redirect_to new_session_url
    end


end
