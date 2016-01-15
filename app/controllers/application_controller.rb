class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def logging_in
    
  end

  def create_guest_user
    guest = User.create(name: "Guest", email: "guest_#{Time.now.to_i}#{rand(100)}@example.com")
    guest.save!(:validate => false)
    session[:guest_user_id] = guest.id
    guest
  end
end
