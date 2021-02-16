ENV['SINATRA_ENV'] ||= "development"
require "sinatra/activerecord"
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require 'dotenv/load'

set :database, {adapter: "sqlite3", database: "db/#{ENV['SINATRA_ENV']}.sqlite"}


require './app/controllers/application_controller'
require_all 'app'