require "eventmachine"
require "socks_tunnel/version"
require "socks_tunnel/buffer"
require "socks_tunnel/coder"
require "socks_tunnel/config"

module SocksTunnel
  autoload :Local,  "socks_tunnel/local"
  autoload :Remote, "socks_tunnel/remote"
end
