class Api::V1::BaseController < ApplicationController
	protect_from_forgery with: :null_session

  	before_action :destroy_session

  	rescue_from ActiveRecord::RecordNotFound, with: :not_found!

  	def destroy_session
    	request.session_options[:skip] = true
  	end

  	def not_found
    	return api_error(status: 404, errors: 'Not found')
  	end

  	def authenticate_user!
    	token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    	vendor_email = options.blank?? nil : options[:email]
    	vendor = vendor_email && Vendor.find_by(email: vendor_email)

    if vendor && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
      @current_vendor = vendor
    else
      return unauthenticated!
    end
  end
end