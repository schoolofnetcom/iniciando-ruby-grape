require 'grape'

module Module2
	class Hello < Grape::API
		format :json

		get '/module2' do
			{ :msg => 'Hello from Module 2' }
		end
	end
end