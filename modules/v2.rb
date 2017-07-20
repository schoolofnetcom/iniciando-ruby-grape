require 'grape'

module V2
	class User < Grape::API
		version 'v2', using: :path

		get '/users' do
			status :ok
		end
	end
end