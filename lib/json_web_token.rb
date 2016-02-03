require 'jwt'

class JsonWebToken
  def JsonWebToken.issue_token(user)
    JsonWebToken.encode({ 'user_id' => user.id })
  end

  def JsonWebToken.valid?(token)
    begin
      JsonWebToken.decode(token)
    rescue
      nil
    end
  end

  def self.encode(payload, expiration = 24.hours.from_now)
    payload = payload.dup
    payload['exp'] = expiration.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base).first
  end
end