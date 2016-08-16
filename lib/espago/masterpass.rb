module Espago
  class Masterpass
    def self.friendly_token
      SecureRandom.base64(15).tr('+/=lIO0', 'aqrsxyz')
    end

    def self.calculate_checksum(app_id, session_id,amount,currency,checksum_key)
      Digest::MD5.hexdigest(
        [app_id.to_s, session_id.to_s, amount.to_s, currency.to_s, checksum_key.to_s].join('|')
      )
    end

    def self.masterpass_post(api_v=nil)
    end

    def self.make_currency(data_currency)
      (data_currency || Espago.currency).upcase
    end

    def self.prepare_form(data)
      data[:masterpass_action] ||=  'checkout'
      data[:app_id] ||=  Espago.app_id
      data[:api_version] ||= Espago.api_version
      data[:amount] = format('%.2f', data[:amount])
      data[:checksum] = calculate_checksum(data[:app_id],data[:session_id],data[:amount],data[:currency],data[:checksum_key]|| Espago.checksum_key)
      data
    end

    def self.prepare_pairing_form(data)
      data[:masterpass_action] ||=  'pairing'
      data[:app_id] ||=  Espago.app_id
      data[:api_version] ||= Espago.api_version
      data[:checksum] = calculate_checksum(data[:app_id],data[:session_id],data[:user_id],'',data[:checksum_key]|| Espago.checksum_key)
      data
    end
    def self.prepare_precheckout_form(data)
      data[:masterpass_action] ||=  'precheckout'
      data[:app_id] ||=  Espago.app_id
      data[:api_version] ||= Espago.api_version
      data[:amount] = format('%.2f', data[:amount])
      data[:checksum] = calculate_checksum(data[:app_id],data[:session_id],data[:amount],data[:currency],data[:checksum_key]|| Espago.checksum_key)
      data
    end

  end
end
