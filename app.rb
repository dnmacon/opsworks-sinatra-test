require 'sinatra'
require 'logger'

::Logger.class_eval { alias :write :'<<' }
access_log = ::File.join(::File.dirname(::File.expand_path(__FILE__)),'log','access.log')
access_logger = ::Logger.new(access_log)
error_logger = ::File.new(::File.join(::File.dirname(::File.expand_path(__FILE__)),'log','error.log'),"a+")
error_logger.sync = true

configure do
  use ::Rack::CommonLogger, access_logger
end

not_found do
  404
end

get '/' do
  "Environment variable TEST_KEY is "\
  "#{ENV['TEST_KEY'] ? 'set' : 'not set'}."
end
