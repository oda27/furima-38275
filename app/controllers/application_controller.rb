class ApplicationController < ActionController::Base

  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kanji_last_name, :kanji_first_name, :kana_last_name, :kana_first_name, :nickname, :birthday])
  end
end
