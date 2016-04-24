class Api::V1::SessionsController < Api::V1::BaseController
  def create
    vendor = Vendor.find_by(email: create_params[:email])
    if vendor && vendor.authenticate(create_params[:password])
      self.current_vendor = vendor
      render(
        json: Api::V1::SessionSerializer.new(vendor, root: false).to_json,
        status: 201
      )
    else
      return api_error(status: 401)
    end
  end

  private
  def create_params
    params.require(:vendor).permit(:email, :password)
  end
end