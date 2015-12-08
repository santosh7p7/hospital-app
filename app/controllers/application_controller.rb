
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :verify_authenticity_token, if: :json_request?

  protected

  def json_request?
    request.format.json?
  end
end