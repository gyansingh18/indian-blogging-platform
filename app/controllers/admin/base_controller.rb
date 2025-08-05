class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  skip_before_action :verify_authenticity_token, only: [:login, :destroy]

  def login
    # handles both GET (show form) and POST (process login)
    if request.post?
      # process the login form
      authenticate_admin!
    else
      # show the login form
      render 'admin/login', layout: false
    end
  end

  def logout
    session[:admin_logged_in] = nil
    redirect_to admin_login_path
  end

  private

  def authenticate_admin!
    # simple hardcoded credentials for this project
    admin_username = "admin"
    admin_password = "admin123"

    # if already logged in, just continue
    if session[:admin_logged_in]
      return
    end

    # check the credentials
    if params[:username] == admin_username && params[:password] == admin_password
      session[:admin_logged_in] = true
      redirect_to admin_path, status: :see_other
    elsif request.post? && (params[:username] || params[:password])
      flash[:error] = "Invalid admin credentials"
      render 'admin/login', layout: false
    elsif request.get?
      render 'admin/login', layout: false
    end
  end
end
