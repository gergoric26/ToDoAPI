class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  private


  def authenticated?
    authenticated_or_request_http_basic { |username, password| User.where(name: username, password: password).first }
  end

end
