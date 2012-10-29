module OhaiPrivateIpaddress
  module Helper
    def self.private_ip(host)
      addresses = host.network.interfaces.map do |name, interface|
        interface['addresses'].keys if i['addresses']
      end.flatten.compact

      addresses.grep(/^10\.|^172\.1[6-9]\.|^172\.2\d\.|^172\.3[0-1]\.|^192\.168/).first
    end
  end
end
