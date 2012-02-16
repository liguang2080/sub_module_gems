# -*- encoding : utf-8 -*-
class ActionController::Base
  helper_method :current_user, :logged_in?

  # 从当前请求中获取登录状态
  def get_login_info
    if session[:user]
      self.user = User.find(session[:user])
    end
    if !@u && cookies.signed[:remember_me]
      self.user = User.authenticated_with_token(*cookies.signed[:remember_me])
    end
  end

  def current_user
    logged_in? ? @u : nil
  end

  # return nil or @u
  def logged_in?
    @u
  end
  #
  #
  #   # Store the given user in the session. u is a nil or a user
  def user=(u)
    @u = u
    session[:user] = u.id if u && !u.new_record?
  end


  def login_required
    logged_in? ? true : access_denied
  end
  
  def admin_required
    (logged_in? && @u.is_admin) ? true : access_denied
  end

  def access_denied
    if request.xhr?
      ajax_redirect_to(login_path)
    else
      store_location
      redirect_to login_path
    end
  end
  
  def store_location
    cookies[:return_to] = request.fullpath
  end
  
  def clear_store_location
    cookies.delete :return_to
  end
  #
  #
  #
  #
  #   # redirecto to session[:return_to] or default uri
  #   def redirect_back_or_default(default)
  #     return if performed?
  #     if session[:return_to] && session[:return_to] != "#{request.fullpath}"
  #       return_path = session[:return_to]
  #       session[:return_to] = nil # clear session :return_to
  #       redirect_to(return_path)
  #     else
  #       redirect_to(default)
  #     end
  #   end
end
