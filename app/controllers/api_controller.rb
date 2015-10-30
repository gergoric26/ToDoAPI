class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  def authorized?(list, action)
    case action
    when "show"
      list.permissions == "public" || list.permissions == "viewable" || list.user == @current_user
    when "destroy"
      list.user == @current_user
    when "update"
      list.permissions == "public" || list.user == @current_user
    end
  end

  private


  def authenticated?
    authenticate_or_request_http_basic { |username, password| @current_user = User.where(name: username, password: password).first }
  end

end
