require 'uri'


class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url, uniqueness: true, format: { with: URI.regexp }
	before_create :shorten
	# before the save method is run, it will automatically run the shoten method first.

	def shorten
		self.short_url = SecureRandom.hex(5)
	end

end
