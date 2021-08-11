class ApplicationController < ActionController::Base
    include ApplicationHelper 

    private
    def redirect_to_logged_in?
        redirect_to login_path if !logged_in?
    end 
end
