require 'rest-client'
require 'i18n'

class Zenvia
  attr_accessor :account, :code

  def self.config(&block)
    @@config = block if block_given?
    @@config
  end

  def initialize
    tap(&@@config)
  end

  def send(to, msg)
    request(dispatch: 'send', to: to, msg: I18n.transliterate(msg))
  end

  def receive
    request(dispatch: 'listReceived')
  end

  private
  def request(options = {})
    RestClient.post(endpoint, default.merge(options))
  end

  def default
    { account: account, code: code }
  end

  def endpoint
    'https://www.zenvia360.com.br/GatewayIntegration/msgSms.do'
  end
end
