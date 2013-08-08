require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'
require 'sinatra'
require File.join(File.dirname(__FILE__), 'environment')


class MainApp < Sinatra::Base

  configure do
	  set :views, "#{File.dirname(__FILE__)}/views"
	end

	error do
	  e = request.env['sinatra.error']
	  Kernel.puts e.backtrace.join("\n")
	  'Application error'
	end

	helpers do
	  # add your helpers here
	end

	# root page
	get '/' do
	  haml :root
	end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
