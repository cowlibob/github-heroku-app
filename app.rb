require 'sinatra/base'
require 'json'
require 'sinatra/activerecord'

class App < Sinatra::Base

  configure :production, :development do
    enable :logging
  end

  db = URI.parse(ENV['DATABASE_URL'])
  adapter = (db.scheme == "postgres") ? "postgresql" : db.scheme
  ActiveRecord::Base.configurations[:production] = { 
      :adapter  => adapter,
      :username => db.user,
      :password => db.password,
      :port     => db.port,
      :database => db.path.sub(%r(^/),""),
      :host     => db.host,
      :min_messages => "warning"
  }
  unless ActiveRecord::Base.connected?
      ActiveRecord::Base.establish_connection ActiveRecord::Base.configurations[:production]
      ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  post '/commit' do
    push = JSON.parse(params[:payload])

    clone_url = push['repository']['url']
    commit_id = push['commits'].last['id']

    cloner = Cloner.new(push['repository']['url'])
    cloner.clone('./tmp')


    200
  end

  put '/config/heroku' do
    api_key = params[:key]

    200
  end
    
  run! if app_file == $0
end

