require 'git'

class Cloner
	def initialize(url)
		@url = url
	end

	def clone(output_folder)
		puts "About to clone #{@url} as #{name}"
		Git.clone(@url, File.join(output_folder, name), {:bare => true })
	end

	def name
		@url.match(/\/([^\/&&[\p{Punct}\w]]*)$/)[1]
	end
end