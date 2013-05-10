class ApplicationController < ActionController::Base
  protect_from_forgery
  # Filters are methods that are run before, after or “around” a controller action.
  # Filters are inherited, so if you set a filter on ApplicationController, it will be run on every controller in your application.
 
  private
 
  def current_user
    _current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
  end
  # Finds the User with the ID stored in the session with the key
  # :current_user_id. This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to signin_path # halts request cycle
    end
  end

  def logged_in?
    !!current_user
  end
  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
end
