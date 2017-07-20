load './app.rb'

run Rack::Cascade.new [
	HelloAPI
]