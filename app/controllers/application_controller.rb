# frozen_string_literal: true

# some doc
class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  include Pundit::Authorization

  before_action :authorize_bycript

  # before_action :authenticate_worker!
  # before_action :require_login

  def current_user
    authenticate_token
  end

  def authorize_bycript
    return if authenticate_token

    respond_unauthorized('Access Desnied')
  end

  def respond_unauthorized(message)
    render json: { messages: message }, status: :unauthorized
  end

  private

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      Worker.find_by(token: token)
    end
  end
end
