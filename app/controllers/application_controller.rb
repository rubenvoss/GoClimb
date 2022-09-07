class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!
  before_action :clean_messages, if: :coming_from_chat?

  def storable_location?
   request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
   store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
   stored_location_for(resource_or_scope) || super
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def coming_from_chat?
    request&.referer&.match(/chatrooms\/\d+/)&.size&.positive?
  end

  def clean_messages
    chatroom = Chatroom.find(request.referer.split("/").last)
    other_user = chatroom.other_user(current_user)
    current_user.mark_as_read_with(other_user)
  end
end
