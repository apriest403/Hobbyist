class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_or_guest_user

  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && 
          session[:guest_user_id] != current_user.id
        # logging_in
        guest_user(with_retry = false).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user(with_retry = true)
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

    rescue ActiveRecord::RecordNotFound
      session[:guest_user_id] = nil
      guest_user if with_retry
  end

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
