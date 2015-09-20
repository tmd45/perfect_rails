class ApplicationController < ActionController::Base
  before_action :detect_mobile_variant
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ /iPhone/
  end
end
