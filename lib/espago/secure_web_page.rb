require "forwardable"
module Espago
  class SecureWebPage
    attr_accessor :production

    def self.calculate_checksum(app_id, kind, session_id,amount,currency,ts,checksum_key)
      Digest::MD5.hexdigest(
        [app_id.to_s, kind, session_id.to_s, amount.to_s, currency.to_s, ts.to_s, checksum_key.to_s].join('|')
      )
    end

    def self.form_post(api_v=nil)
      Espago.production ? "https://secure.espago.com/secure_web_page" : "https://sandbox.espago.com/secure_web_page"
    end

    def self.prepare_form(data)
      data[:kind] ||=  'sale'
      data[:ts] ||=  Time.now.to_i
      data[:app_id] ||=  Espago.app_id
      data[:api_version] ||= Espago.api_version
      data[:amount] = format('%.2f', data[:amount])
      data[:checksum] = calculate_checksum(data[:app_id],data[:kind],data[:session_id],data[:amount],data[:currency],data[:ts],data[:checksum_key]|| Espago.checksum_key)
      data
    end


  end
end
