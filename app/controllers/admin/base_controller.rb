class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  def login
    # This method handles both GET and POST requests
    if request.post?
      # Handle login form submission
      authenticate_admin!
    else
      # Show login form
      render 'admin/login', layout: false
    end
  end

  def logout
    session[:admin_logged_in] = nil
    redirect_to admin_login_path
  end

  private

  def authenticate_admin!
    # Hard-coded admin credentials
    admin_username = "admin"
    admin_password = "admin123"

    # Check if admin is already logged in via session
    unless session[:admin_logged_in]
      # Check if credentials are provided
      if params[:username] == admin_username && params[:password] == admin_password
        session[:admin_logged_in] = true
        redirect_to admin_path
      elsif request.post? && (params[:username] || params[:password])
        flash[:error] = "Invalid admin credentials"
        render 'admin/login', layout: false
      elsif request.get?
        render 'admin/login', layout: false
      end
    end
  end
end
