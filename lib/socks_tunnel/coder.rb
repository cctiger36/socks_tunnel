require "openssl"

module SocksTunnel
  class Coder
    def initialize
      cipher = OpenSSL::Cipher.new(Config.cipher)
      key_iv = OpenSSL::PKCS5.pbkdf2_hmac_sha1(Config.password, Config.salt, 2000, cipher.key_len + cipher.iv_len)
      @key = key_iv[0, cipher.key_len]
      @iv = key_iv[cipher.key_len, cipher.iv_len]

      @encoder = OpenSSL::Cipher.new(Config.cipher)
      @encoder.encrypt
      @encoder.key = @key

      @decoder = OpenSSL::Cipher.new(Config.cipher)
      @decoder.decrypt
      @decoder.key = @key
    end

    def encode(data)
      @encoder.iv = @iv
      @encoder.update(data) + @encoder.final
    end

    def decode(data)
      @decoder.iv = @iv
      @decoder.update(data) + @decoder.final
    end
  end
end
