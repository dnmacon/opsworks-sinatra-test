require 'bundler'
Bundler.require
set     :env, :production
disable :run
require './app'

run Sinatra::Application
