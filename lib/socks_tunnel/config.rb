module SocksTunnel
  class Config
    class << self
      attr_accessor :local_server_host, :local_server_port,
        :remote_server_host, :remote_server_port, :password, :salt

      def from(options)
        if options[:remote_addr]
          @local_server_port = options[:port]
          @local_server_host = options[:host] if options[:host]
          @remote_server_host, @remote_server_port = options[:remote_addr].split(':')
        else
          @remote_server_port = options[:port]
        end
        @password = options[:password]
        @salt = options[:salt] if options[:salt]
      end

      def local_server_host
        @local_server_host ||= '127.0.0.1'
      end

      def salt
        @salt ||= "V\x11\x97\xA6r\xEF[\xFE"
      end

      def delimiter
        @delimiter ||= '===SOCKSTUNNEL==='
      end

      def cipher
        @cipher ||= 'AES-256-CBC'
      end
    end
  end
end
