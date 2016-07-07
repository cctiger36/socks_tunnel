require "thor"
require "socks_tunnel"

module SocksTunnel
  class CLI < Thor
    desc "local", "Start local server"
    option :port,        required: true
    option :password,    required: true
    option :remote_addr, required: true
    option :host
    def local
      Config.from(options)
      Local.run
    end

    desc "remote", "Start remote server"
    option :port,     required: true
    option :password, required: true
    def remote
      Config.from(options)
      Remote.run
    end
  end
end
