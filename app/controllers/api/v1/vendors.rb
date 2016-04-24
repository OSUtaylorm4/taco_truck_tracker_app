class Api::V1::VendorsController < Api::V1::BaseController
  include ActiveHashRelation

  def index
    vendors = Vendor.all

    vendors = apply_filters(users, params)

    render(
      json: ActiveModel::ArraySerializer.new(
        vendors,
        each_serializer: Api::V1::VendorSerializer,
        root: 'vendors',
      )
    )
  end
end
