load './app.rb'

run Rack::Cascade.new [
	App
]