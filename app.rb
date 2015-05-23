require 'sinatra'

not_found do
  404
end

get '/' do
  "Environment variable TEST_KEY is "\
  "#{ENV['TEST_KEY'] ? 'set' : 'not set'}."
end
