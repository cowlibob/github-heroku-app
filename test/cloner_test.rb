require 'minitest/spec'
require 'minitest/autorun'
require 'fileutils'
require 'cloner'

describe Cloner do
	it 'Can be created with a url' do
		Cloner.new('https://github.com/cowlibob/github-heroku-app').must_be_instance_of Cloner
	end

	describe clone do
		it 'should output a new folder in tmp when clone is called' do
      Dir.glob(File.join('tmp', 'github-heroku-app')).wont_include('tmp/github-heroku-app')


  		@cloner  = Cloner.new('https://github.com/cowlibob/github-heroku-app')
			@cloner.clone('./tmp')

			Dir.glob(File.join('tmp', 'github-heroku-app')).must_include('tmp/github-heroku-app')
		end
	end

  describe name do
    it 'should return the last portion of the url' do
      @cloner = Cloner.new('https://github.com/cowlibob/github-heroku-app')
      @cloner.name.must_equal('github-heroku-app')
    end
  end

  after do
    `rmdir /s/q .\\tmp\\github-heroku-app` if File.exist?(File.join('tmp', 'github-heroku-app'))
  end

end