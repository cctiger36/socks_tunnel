require 'spec_helper'
require 'securerandom'

describe SocksTunnel::Coder do
  before { SocksTunnel::Config.password = 'test_password' }
  let(:coder) { SocksTunnel::Coder.new }

  it 'should encode and decode correctly' do
    10.times do
      origin = SecureRandom.hex
      encoded = coder.encode(origin)
      expect(encoded).to_not eq origin
      decoded = coder.decode(encoded)
      expect(decoded).to eq origin
    end
  end

  it 'encoded data should be different when using different password' do
    origin = SecureRandom.hex
    encoded_1 = coder.encode(origin)
    SocksTunnel::Config.password = 'another_password'
    another_coder = SocksTunnel::Coder.new
    encoded_2 = another_coder.encode(origin)
    expect(encoded_1).to_not eq encoded_2
  end
end
