require 'sinatra/base'

class App < Sinatra::Base

	post '/commit' do
		"json params::: #{params}"
	end
	
	run! if app_file == $0
end

