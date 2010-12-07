class LoginController < ApplicationController
  before_filter :valid, :except => [:index, :authenticate, :logout]
  
  def valid
    if !session[:user_id]
      flash[:notice] = "Please login to access admin home page"
      redirect_to :action => 'index'
    end
  end

  def index
  end
  
  def home
  end
  
    def authenticate

      #Will create a new object of User, retrieve values from the form and store it variable @user.
      @user = User.new(params[:userform])
      
      #find records with username,password
      valid_user = User.find(:first,:conditions => ["user_name = ? and password = ?",@user.user_name, @user.password])
          #if statement checks whether valid_user exists or not
      if valid_user
      #creates a session with username
          session[:user_id]=valid_user.user_name
          session[:id]=valid_user.id
          session[:first_name]=valid_user.first_name
          session[:last_name]=valid_user.last_name
          redirect_to :action => 'home'
      else
          flash[:notice] = "Invalid User/Password"
          redirect_to :action=> 'index'
      end
  end
  
  def logout
    if session[:user_id]
        reset_session
        redirect_to :action=> 'index'
    end
  end

end
