require 'net/http/generic_request'

module Net
  class HTTP
    def send_request(name, path, data = nil, header = nil)
      @ssl_version = :TLSv1
      r = HTTPGenericRequest.new(name, (data ? true : false), true, path, header)
      request r, data
    end
  end
end
