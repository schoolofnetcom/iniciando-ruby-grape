require 'grape'

class HelloAPI < Grape::API 

	format :json

	get '/' do
		{ :msg => 'Hello From Grape API' }
	end

	post '/post' do 
		{ :msg => 'Hello From Grape API from POST request' }		
	end

	# /hello
	resource 'hello' do

		desc 'Return a JSON object msg /hello/:id'
		route_param :id do
			get do
				{ :msg => 'Hello from /hello resource', params: params[:id] }
			end
		end

		desc 'Return a JSON object msg like GET /hello but using POST request'
		params do
			requires :name, type: String, desc: 'Person name'
			requires :age, type: Integer, desc: 'Person age'
		end
		route_param :id do 
			post do 
				{ :msg => 'Hello from /hello POST resource', params: params }
			end
		end
	end
end