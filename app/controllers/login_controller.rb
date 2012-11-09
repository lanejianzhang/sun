# To change this template, choose Tools | Templates
# and open the template in the editor.

class LoginController < ApplicationController
  
  def index
    
  end

  def show

  end

  def new

  end

  def edit
    
  end
  
  def create
    user = User.new
    user.name = params[:txtUserName]
    user.email = params[:txtEmail]
    user.passwd = params[:txtPassword]

    if user.save
      flash[:message] = "succed!"
      redirect_to '/login'
    else
      flash[:message] = "failed"
      redirect_to '/login'
    end
    
  end
  
  def login_in
    #ActiveRecord::Base.connection.execute(query)
    # @user = ActiveRecord::Base.connection.execute("select * from users where email='" + params[:txtemail] + "'")
   
    #@user = User.execute("select * from users where email='" + params[:txtemail] + "'")

    #ActiveRecord::Base.connection.execute(sql)
    #@user2 = params[:txtemail]
    #User.find
    
    if request.post?
      if session[:email] == nil
        @user = User.find_by_email(params[:txtemail])
        
        if @user != nil
          if @user.passwd == params[:txtpassword]
            session[:email] = @user.email
            session[:username] = @user.name
            flash[:message] = 'Success login'
            redirect_to '/login'
          else
            flash[:message] = 'Password Wrong,please try again'
            redirect_to '/login'
          end
        else
          flash[:message] = 'User not exist , please regist first'
          redirect_to '/login'
        end
      else
        flash[:message] = 'You have logined'
        redirect_to '/login'
      end
    end
  end
  
  def logout
    session[:email] = nil
    session[:username] = nil
    redirect_to '/login'
  end
end



























