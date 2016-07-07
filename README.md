# SocksTunnel

Establish secure tunnel via Socks 5. Currently support TCP only.

## Installation

    $ gem install socks_tunnel

## Usage

Start local server

    socks_tunnel local --password=PASSWORD --port=PORT --remote-addr=REMOTE_ADDR

Options

<table>
  <tr>
    <td>--port</td><td>The port number to listen.</td><td>Required</td>
  </tr>
  <tr>
    <td>--password</td><td>The password for generating encryption key and iv.</td><td>Required</td>
  </tr>
  <tr>
    <td>--remote-addr</td><td>The address of remote server. (host:port)</td><td>Required</td>
  </tr>
  <tr>
    <td>--host</td><td>When running local server on a different machine, use this to set the IP.</td><td>Optional</td>
  </tr>
  <tr>
    <td>--salt</td><td>The salt for generating encryption key and iv.</td><td>Optional</td>
  </tr>
  <tr>
    <td>--daemon</td><td>Run in the background.</td><td>Optional</td>
  </tr>
</table>

Start remote server

    socks_tunnel remote --password=PASSWORD --port=PORT

Options

<table>
  <tr>
    <td>--port</td><td>The port number to listen.</td><td>Required</td>
  </tr>
  <tr>
    <td>--password</td><td>The password for generating encryption key and iv.</td><td>Required</td>
  </tr>
  <tr>
    <td>--salt</td><td>The salt for generating encryption key and iv.</td><td>Optional</td>
  </tr>
  <tr>
    <td>--daemon</td><td>Run in the background.</td><td>Optional</td>
  </tr>
</table>

*Password* and *Salt* used in both local and remote server should be the same.

## Example

Test on local machine

    # Start local server
    socks_tunnel local --password=mypassword --port=8081 --remote-addr=127.0.0.1:8082
    # Start remote server
    socks_tunnel remote --password=mypassword --port=8082

    # Use curl to test
    curl --socks5 localhost:8081 https://github.com/

Run *Remote server* on a real server

    # Start local server
    socks_tunnel local --password=mypassword --port=8081 --remote-addr=[SERVER_IP]:8082
    # Start remote server
    socks_tunnel remote --password=mypassword --port=8082

    # Use curl to test
    curl --socks5 localhost:8081 https://github.com/
