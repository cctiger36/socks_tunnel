require 'spec_helper'

describe SocksTunnel::Buffer do
  let(:buffer) { SocksTunnel::Buffer.new }
  before do
    buffer << 'DATA1'
    buffer << SocksTunnel::Config.delimiter
    buffer << 'DATA2'
    buffer << SocksTunnel::Config.delimiter
    buffer << 'DATA3'
  end
  after { buffer.clear }

  describe '#each' do
    it 'should return data when delimiter appeared' do
      segments = []
      buffer.each do |seg|
        segments << seg
      end
      expect(segments.size).to be 2
      expect(segments[0]).to eq 'DATA1'
      expect(segments[1]).to eq 'DATA2'
    end
  end

  describe '#shift' do
    it 'should return the first segment' do
      segment = buffer.shift
      expect(segment).to eq 'DATA1'
      rest_buffer = buffer.instance_variable_get(:@buffer_data)
      expect(rest_buffer).to_not be_empty
      expect(rest_buffer).to_not include 'DATA1'
    end
  end
end
