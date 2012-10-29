module OhaiPrivateIpaddress
  module Helper
    def self.ip(host, interface = 'private-ipaddress')
      return if host.nil?
      case interface
        when 'private-ipaddress'
          private_ip(host)
        when 'ipaddress'
          host.ipaddress
        when 'localhost'
          '127.0.0.1'
      end
    end

    def self.private_ip(host)
      addresses = host.network.interfaces.map do |name, interface|
        interface['addresses'].keys if interface['addresses']
      end.flatten.compact

      addresses.grep(/^10\.|^172\.1[6-9]\.|^172\.2\d\.|^172\.3[0-1]\.|^192\.168/).first
    end
  end
end
