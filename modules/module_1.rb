require 'grape'

module Module1
	class Hello < Grape::API
		# prefix 'v1'
		format :json

		# http://localhost:9292/api/
		get '/' do
			{ :msg => 'Hello From Module1' }
		end
	end
end