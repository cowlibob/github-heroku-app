require 'sinatra/base'

class App < Sinatra::Base

	post '/commit' do
		params
	end
	
	run! if app_file == $0
end

