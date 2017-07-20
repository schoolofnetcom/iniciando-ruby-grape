require 'grape'

module V1
	class User < Grape::API
		version 'v1', using: :path
		
		get '/users' do
			status :ok
		end
	end
end