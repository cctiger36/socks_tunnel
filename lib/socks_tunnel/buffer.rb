module SocksTunnel
  class Buffer
    def initialize
      @buffer_data = ''
    end

    def <<(data)
      @buffer_data << data
    end

    def each
      loop do
        fore, rest = @buffer_data.split(Config.delimiter, 2)
        break unless rest
        yield fore
        @buffer_data = rest
      end
    end

    def shift
      fore, rest = @buffer_data.split(Config.delimiter, 2)
      if rest
        @buffer_data = rest
        return fore
      end
      nil
    end

    def clear
      @buffer_data = ''
    end
  end
end
