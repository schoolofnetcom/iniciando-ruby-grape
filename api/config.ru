require 'rack/cors'

use Rack::Cors do
	allow do
		origins '*'
		resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
	end
end

require './app/db'
require './app/product'

run Products::API