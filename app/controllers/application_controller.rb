class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

# class ApplicationController < ActionController
#   def index
#      redirect_to :action => :contact
#   end

#   def contact
#   end
# end