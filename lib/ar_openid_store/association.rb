require 'openid/association'
require 'time'

module ArOpenidStore
  class Association < ActiveRecord::Base
    self.table_name = 'open_id_associations'
    attr_accessible :server_url, :handle, :secret, :issued, :lifetime, :assoc_type

    def from_record
      OpenID::Association.new(handle, secret, Time.at(issued), lifetime, assoc_type)
    end
  end
end

