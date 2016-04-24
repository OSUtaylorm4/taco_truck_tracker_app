class Api::VendorSerializer < Api::BaseSerializer
  attributes :id, :username, :latitude, :longitude, :created_at, :updated_at,
        :company, :image, :website, :phone, :menu1, :menu2, :status,
        :sun_open, :sun_close, :mon_open, :mon_close, :tues_open, :tues_close,
        :weds_open, :weds_close, :thurs_open, :thurs_close, :fri_open,
        :fri_close, :sat_open, :sat_close, :sun_loc, :mon_loc, :tues_loc,
        :weds_loc, :thurs_loc, :fri_loc, :sat_loc

  has_many :reviews

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end

end