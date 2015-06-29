require 'zenvia'

Zenvia.config do |config|
  config.account = ENV['ZENVIA_ACCOUNT']
  config.code = ENV['ZENVIA_CODE']
end
